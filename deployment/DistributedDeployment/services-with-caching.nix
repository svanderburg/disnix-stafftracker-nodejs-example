{distribution, invDistribution, system, pkgs}:

let
  services = import ./services.nix {
    inherit distribution invDistribution system pkgs;
  };
  customPkgs = import ../top-level/all-packages.nix { inherit system pkgs; };
in
services // {
  nginx = services.nginx // {
    pkg = customPkgs.nginx-wrapper { enableCache = true; };
  };
}
