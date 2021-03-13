{createManagedProcess, roomservice}:
{port, instanceSuffix ? "", instanceName ? "roomservice${instanceSuffix}"}:
{rooms}:

createManagedProcess {
  inherit instanceName;

  description = "Roomservice REST API";
  foregroundProcess = "${roomservice}/lib/node_modules/roomservice/app.js";
  environment = {
    ROOMSDB_URL = "mongodb://${rooms.target.properties.hostname}";
    ROOMSDB_NAME = rooms.name;
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
        description = "Rooms API user";
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
