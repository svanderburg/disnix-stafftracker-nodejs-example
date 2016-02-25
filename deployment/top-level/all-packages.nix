{system, pkgs}:

let
  callPackage = pkgs.lib.callPackageWith (pkgs // self);

  self = rec {
### Databases

    rooms = callPackage ../pkgs/databases/rooms { };
    
    staff = callPackage ../pkgs/databases/staff { };
    
    zipcodes = callPackage ../pkgs/databases/zipcodes { };

### REST services

    roomservice = (import ../../services/webservices/roomservice {
      inherit system pkgs;
    }).package;
    
    roomservicewrapper = callPackage ../pkgs/webservices/roomservice/wrapper.nix { };
    
    staffservice = (import ../../services/webservices/staffservice {
      inherit system pkgs;
    }).package;
    
    staffservicewrapper = callPackage ../pkgs/webservices/staffservice/wrapper.nix { };
    
    zipcodeservice = (import ../../services/webservices/zipcodeservice {
      inherit system pkgs;
    }).package;
    
    zipcodeservicewrapper = callPackage ../pkgs/webservices/zipcodeservice/wrapper.nix { };
    
### Web applications

    stafftracker = (import ../../services/webapplications/stafftracker {
      inherit system pkgs;
    }).package;
    
    stafftrackerwrapper = callPackage ../pkgs/webapplications/stafftracker/wrapper.nix { };

### Reverse proxy

    nginx-wrapper = callPackage ../pkgs/nginx-wrapper/default.nix { };
  };

in
self
