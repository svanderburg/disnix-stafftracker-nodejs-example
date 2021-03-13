{createManagedProcess, staffservice}:
{port, instanceSuffix ? "", instanceName ? "staffservice${instanceSuffix}"}:
{staff}:

createManagedProcess {
  inherit instanceName;

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
