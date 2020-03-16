{distribution, invDistribution, system, pkgs}:

let
  customPkgs = import ../top-level/all-packages.nix { inherit system pkgs; };
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
    type = "process";
    portAssign = "shared";
    port = portsConfiguration.ports.roomservice or 0;
  };
  
  staffservice = rec {
    name = "staffservice";
    pkg = customPkgs.staffservicewrapper { inherit port; };
    dependsOn = {
      inherit staff;
    };
    type = "process";
    portAssign = "shared";
    port = portsConfiguration.ports.staffservice or 0;
  };
  
  zipcodeservice = rec {
    name = "zipcodeservice";
    pkg = customPkgs.zipcodeservicewrapper { inherit port; };
    dependsOn = {
      inherit zipcodes;
    };
    type = "process";
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
    type = "process";
    port = portsConfiguration.ports.stafftracker or 0;
    portAssign = "shared";
    baseURL = "/";
  };

### Reverse proxy

  nginx = {
    name = "nginx";
    pkg = customPkgs.nginx-wrapper { enableCache = false; };
    dependsOn = {
      inherit stafftracker;
    };
    type = "wrapper";
  };
}
