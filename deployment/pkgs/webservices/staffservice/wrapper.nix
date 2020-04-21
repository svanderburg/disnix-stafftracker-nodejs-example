/*{stdenv, staffservice}:
{port}:
{staff}:

stdenv.mkDerivation {
  name = "staffservice-wrapper";
  buildCommand = ''
    mkdir -p $out/bin
    cat > $out/bin/run-staffservice <<EOF
    #! ${stdenv.shell} -e
    export STAFFDB_URL=mongodb://${staff.target.properties.hostname} # Configure the URL of the Mongo database using inter-dependency parameters
    export STAFFDB_NAME="${staff.name}"
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
*/

{createManagedProcess, staffservice}:
{port, instanceSuffix ? ""}:
{staff}:

let
  instanceName = "staffservice${instanceSuffix}";
in
createManagedProcess {
  name = instanceName;
  description = "Staff REST API";
  foregroundProcess = "${staffservice}/lib/node_modules/staffservice/app.js";
  environment = {
    STAFFDB_URL = "mongodb://${staff.target.properties.hostname}";
    STAFFDB_NAME = staff.name;
    PORT = port;
  };
  user = instanceName;

  credentials = {
    groups = {
      "${instanceName}" = {};
    };
    users = {
      "${instanceName}" = {
        group = instanceName;
        description = "Staff API user";
      };
    };
  };

  overrides = {
    sysvinit = {
      runlevels = [ 3 4 5 ];
    };
    systemd = {
      Service.Restart = "always";
    };
  };
}
