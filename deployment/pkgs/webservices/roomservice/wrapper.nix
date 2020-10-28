{createManagedProcess, roomservice}:
{port, instanceSuffix ? ""}:
{rooms}:

let
  instanceName = "roomservice${instanceSuffix}";
in
createManagedProcess {
  name = instanceName;
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
