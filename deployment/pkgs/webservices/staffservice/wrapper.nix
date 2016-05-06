{stdenv, staffservice}:
{port}:
{staff}:

stdenv.mkDerivation {
  name = "staffservice-wrapper";
  buildCommand = ''
    mkdir -p $out/bin
    cat > $out/bin/run-staffservice <<EOF
    #! ${stdenv.shell} -e
    export STAFFDB_URL=mongodb://${staff.target.properties.hostname}/${staff.name} # Configure the URL of the Mongo database using inter-dependency parameters
    export PORT=${toString port}
    ${staffservice}/bin/staffservice
    EOF
    chmod +x $out/bin/run-staffservice
    
    # Add configuration file that specifies under which user the process runs
    mkdir -p $out/etc
    cat > $out/etc/process_config <<EOF
    container_username=staffservice
    container_group=staffservice
    EOF
    
    # Restart the job when it accidentally terminates
    cat > $out/etc/systemd-config <<EOF
    Restart=always
    EOF
  '';
}
