{distribution, system, pkgs}:

let customPkgs = import ../top-level/all-packages.nix { inherit system pkgs; };
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
    port = 3001;
  };
  
  staffservice = rec {
    name = "staffservice";
    pkg = customPkgs.staffservicewrapper { inherit port; };
    dependsOn = {
      inherit staff;
    };
    type = "process";
    port = 3002;
  };
  
  zipcodeservice = rec {
    name = "zipcodeservice";
    pkg = customPkgs.zipcodeservicewrapper { inherit port; };
    dependsOn = {
      inherit zipcodes;
    };
    type = "process";
    port = 3003;
  };

### Web applications

  stafftracker = rec {
    name = "stafftracker";
    pkg = customPkgs.stafftrackerwrapper { inherit port; };
    dependsOn = {
      inherit roomservice staffservice zipcodeservice;
    };
    type = "process";
    port = 3000;
  };
}
