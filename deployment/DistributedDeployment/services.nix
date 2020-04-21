{ distribution, invDistribution, system, pkgs
, stateDir ? "/var"
, runtimeDir ? "${stateDir}/run"
, logDir ? "${stateDir}/log"
, tmpDir ? (if stateDir == "/var" then "/tmp" else "${stateDir}/tmp")
, cacheDir ? "${stateDir}/cache"
, forceDisableUserChange ? false
, processManager ? "systemd"
}:

let
  customPkgs = import ../top-level/all-packages.nix {
    inherit system pkgs stateDir logDir runtimeDir tmpDir forceDisableUserChange processManager;
  };

  sharedConstructors = import ../../../nix-processmgmt/examples/services-agnostic/constructors.nix {
    inherit pkgs stateDir logDir runtimeDir tmpDir cacheDir forceDisableUserChange processManager;
  };

  processType =
    if processManager == null then "managed-process"
    else if processManager == "sysvinit" then "sysvinit-script"
    else if processManager == "systemd" then "systemd-unit"
    else if processManager == "supervisord" then "supervisord-program"
    else if processManager == "bsdrc" then "bsdrc-script"
    else if processManager == "cygrunsrv" then "cygrunsrv-service"
    else if processManager == "launchd" then "launchd-daemon"
    else throw "Unknown process manager: ${processManager}";

  portsConfiguration = if builtins.pathExists ./ports.nix then import ./ports.nix else {};
in
rec {
### Databases

  rooms = {
    name = "rooms";
    pkg = customPkgs.rooms;
    dependsOn = {};
    type = "mongo-database";
  };

  staff = {
    name = "staff";
    pkg = customPkgs.staff;
    dependsOn = {};
    type = "mongo-database";
    deployState = true;
  };

  zipcodes = {
    name = "zipcodes";
    pkg = customPkgs.zipcodes;
    dependsOn = {};
    type = "mongo-database";
  };

### Web services

  roomservice = rec {
    name = "roomservice";
    pkg = customPkgs.roomservicewrapper { inherit port; };
    dependsOn = {
      inherit rooms;
    };
    type = processType;
    portAssign = "shared";
    port = portsConfiguration.ports.roomservice or 0;
  };

  staffservice = rec {
    name = "staffservice";
    pkg = customPkgs.staffservicewrapper { inherit port; };
    dependsOn = {
      inherit staff;
    };
    type = processType;
    portAssign = "shared";
    port = portsConfiguration.ports.staffservice or 0;
  };

  zipcodeservice = rec {
    name = "zipcodeservice";
    pkg = customPkgs.zipcodeservicewrapper { inherit port; };
    dependsOn = {
      inherit zipcodes;
    };
    type = processType;
    portAssign = "shared";
    port = portsConfiguration.ports.zipcodeservice or 0;
  };

### Web applications

  stafftracker = rec {
    name = "stafftracker";
    pkg = customPkgs.stafftrackerwrapper { inherit port; };
    dependsOn = {
      inherit roomservice staffservice zipcodeservice;
    };
    type = processType;
    port = portsConfiguration.ports.stafftracker or 0;
    portAssign = "shared";
    baseURL = "/";
  };

### Reverse proxy

  nginx = {
    name = "nginx";
    pkg = sharedConstructors.nginxReverseProxyPathBased {
      enableCache = false;
    };
    dependsOn = {
      inherit stafftracker;
    };
    type = processType;
  };
}
