{ distribution, invDistribution, system, pkgs
, stateDir ? "/var"
, runtimeDir ? "${stateDir}/run"
, logDir ? "${stateDir}/log"
, tmpDir ? (if stateDir == "/var" then "/tmp" else "${stateDir}/tmp")
, cacheDir ? "${stateDir}/cache"
, forceDisableUserChange ? false
, processManager ? "systemd"
, nix-processmgmt ? ../../../nix-processmgmt
, nix-processmgmt-services ? ../../../nix-processmgmt-services
}:

let
  ids = if builtins.pathExists ./ids.nix then (import ./ids.nix).ids else {};

  customPkgs = import ../top-level/all-packages.nix {
    inherit system pkgs stateDir logDir runtimeDir tmpDir forceDisableUserChange processManager ids nix-processmgmt;
  };

  sharedConstructors = import "${nix-processmgmt-services}/services-agnostic/constructors.nix" {
    inherit nix-processmgmt pkgs stateDir logDir runtimeDir tmpDir cacheDir forceDisableUserChange processManager;
  };

  processType = import "${nix-processmgmt}/nixproc/derive-dysnomia-process-type.nix" {
    inherit processManager;
  };
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
    port = ids.ports.roomservice or 0;
    pkg = customPkgs.roomservicewrapper { inherit port; };
    dependsOn = {
      inherit rooms;
    };
    type = processType;
    requiresUniqueIdsFor = [ "ports" "uids" "gids" ];
  };

  staffservice = rec {
    name = "staffservice";
    port = ids.ports.staffservice or 0;
    pkg = customPkgs.staffservicewrapper { inherit port; };
    dependsOn = {
      inherit staff;
    };
    type = processType;
    requiresUniqueIdsFor = [ "ports" "uids" "gids" ];
  };

  zipcodeservice = rec {
    name = "zipcodeservice";
    port = ids.ports.zipcodeservice or 0;
    pkg = customPkgs.zipcodeservicewrapper { inherit port; };
    dependsOn = {
      inherit zipcodes;
    };
    type = processType;
    requiresUniqueIdsFor = [ "ports" "uids" "gids" ];
  };

### Web applications

  stafftracker = rec {
    name = "stafftracker";
    port = ids.ports.stafftracker or 0;
    pkg = customPkgs.stafftrackerwrapper { inherit port; };
    dependsOn = {
      inherit roomservice staffservice zipcodeservice;
    };
    type = processType;
    baseURL = "/";
    requiresUniqueIdsFor = [ "ports" "uids" "gids" ];
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
