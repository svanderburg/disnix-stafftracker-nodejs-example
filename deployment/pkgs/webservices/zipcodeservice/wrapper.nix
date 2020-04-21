/*{stdenv, zipcodeservice}:
{port}:
{zipcodes}:

stdenv.mkDerivation {
  name = "zipcodeservice-wrapper";
  buildCommand = ''
    mkdir -p $out/bin
    cat > $out/bin/run-zipcodeservice <<EOF
    #! ${stdenv.shell} -e
    export ZIPCODESDB_URL=mongodb://${zipcodes.target.properties.hostname} # Configure the URL of the Mongo database using inter-dependency parameters
    export ZIPCODESDB_NAME="${zipcodes.name}"
    export PORT=${toString port}
    ${zipcodeservice}/bin/zipcodeservice
    EOF
    chmod +x $out/bin/run-zipcodeservice
    
    # Add configuration file that specifies under which user the process runs
    mkdir -p $out/etc
    cat > $out/etc/process_config <<EOF
    container_username=zipcodeservice
    container_group=zipcodeervice
    EOF
    
    # Restart the job when it accidentally terminates
    cat > $out/etc/systemd-config <<EOF
    Restart=always
    EOF
  '';
}*/

{createManagedProcess, zipcodeservice}:
{port, instanceSuffix ? ""}:
{zipcodes}:

let
  instanceName = "zipcodeservice${instanceSuffix}";
in
createManagedProcess {
  name = instanceName;
  description = "Zipcodes REST API";
  foregroundProcess = "${zipcodeservice}/lib/node_modules/zipcodeservice/app.js";
  environment = {
    ZIPCODESDB_URL = "mongodb://${zipcodes.target.properties.hostname}";
    ZIPCODESDB_NAME = zipcodes.name;
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
        description = "Zipcodes API user";
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
