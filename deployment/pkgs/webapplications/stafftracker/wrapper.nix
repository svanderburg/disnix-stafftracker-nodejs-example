{createManagedProcess, stafftracker}:
{port, instanceSuffix ? ""}:
{zipcodeservice, staffservice, roomservice}:

let
  instanceName = "stafftracker${instanceSuffix}";
in
createManagedProcess {
  name = instanceName;
  description = "StaffTracker front-end";
  foregroundProcess = "${stafftracker}/lib/node_modules/stafftracker/app.js";
  environment = {
    STAFFSERVICE_URL = "http://${staffservice.target.properties.hostname}:${toString staffservice.port}";
    ZIPCODESERVICE_URL = "http://${zipcodeservice.target.properties.hostname}:${toString zipcodeservice.port}";
    ROOMSERVICE_URL = "http://${roomservice.target.properties.hostname}:${toString roomservice.port}";
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
        description = "StaffTracker user";
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
