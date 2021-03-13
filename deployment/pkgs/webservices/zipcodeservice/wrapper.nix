{createManagedProcess, zipcodeservice}:
{port, instanceSuffix ? "", instanceName ? "zipcodeservice${instanceSuffix}"}:
{zipcodes}:

createManagedProcess {
  inherit instanceName;

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
