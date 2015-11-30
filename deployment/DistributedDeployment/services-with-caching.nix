{distribution, system, pkgs}:

let
  services = import ./services.nix {
    inherit distribution system pkgs;
  };
  customPkgs = import ../top-level/all-packages.nix { inherit system pkgs; };
in
services // {
  nginx = services.nginx // {
    pkg = customPkgs.nginx-wrapper { enableCache = true; };
  };
}
