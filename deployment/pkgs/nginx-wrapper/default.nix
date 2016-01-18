{stdenv, nginx}:
{enableCache}:
interDeps:

let
  stateDir = "/var/spool/nginx";
  cacheDir = "/var/cache/nginx";
in
stdenv.mkDerivation {
  name = "nginx-wrapper";
  buildCommand = ''
    # Generate wrapper script
    
    mkdir -p $out/bin
    cat > $out/bin/wrapper <<EOF
    #! ${stdenv.shell} -e
    
    case "\$1" in
        activate)
            mkdir -p ${stateDir}/logs
            chmod 700 ${stateDir}
            chown -R nginx:nginx ${stateDir}
            
            mkdir -p ${cacheDir}
            chown -R nginx:nginx ${cacheDir}
            
            ${nginx}/bin/nginx -c $out/etc/nginx.conf -p ${stateDir}
            ;;
    esac
    
    EOF
    chmod +x $out/bin/wrapper
    
    # Generate configuration file
    mkdir -p $out/etc
    cat > $out/etc/nginx.conf << "EOF"
    user nginx nginx;
    
    events {
      worker_connections 190000;
    }
    
    http {
      ${stdenv.lib.optionalString enableCache ''
        ${stdenv.lib.concatMapStrings (serviceName:
          ''
            proxy_cache_path ${cacheDir}/${serviceName} keys_zone=${serviceName}:8m inactive=5m max_size=128m;
          ''
        ) (builtins.attrNames interDeps)}
      ''}
      
      ${stdenv.lib.concatMapStrings (serviceName:
        ''
          upstream ${serviceName} {
            ip_hash;
            ${let
              service = builtins.getAttr serviceName interDeps;
              targets = service.targets;
            in
            stdenv.lib.concatMapStrings (target: "server ${target.hostname}:${toString service.port};\n") targets}
          }
        ''
      ) (builtins.attrNames interDeps)}
      
      server {
        ${stdenv.lib.concatMapStrings (serviceName:
          let
            service = builtins.getAttr serviceName interDeps;
          in
          ''
            location ${service.baseURL} {
              proxy_pass        http://${serviceName};
              ${stdenv.lib.optionalString enableCache ''
                proxy_cache       ${serviceName};
                proxy_cache_key   $host$uri$is_args$args;
                proxy_cache_valid 200 5m;
                proxy_cache_lock  on;
              ''}
            }
          '') (builtins.attrNames interDeps)}
      }
    }
    EOF
  '';
}
