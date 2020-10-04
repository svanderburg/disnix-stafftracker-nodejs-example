{ distribution, invDistribution, system, pkgs
, stateDir ? "/var"
, runtimeDir ? "${stateDir}/run"
, logDir ? "${stateDir}/log"
, tmpDir ? (if stateDir == "/var" then "/tmp" else "${stateDir}/tmp")
, cacheDir ? "${stateDir}/cache"
, forceDisableUserChange ? false
, processManager ? "systemd"
, nix-processmgmt ? ../../../nix-processmgmt
}@args:

let
  services = import ./services.nix args;

  sharedConstructors = import "${nix-processmgmt}/examples/services-agnostic/constructors.nix" {
    inherit pkgs stateDir logDir runtimeDir tmpDir cacheDir forceDisableUserChange processManager;
  };
in
services // {
  nginx = services.nginx // {
    pkg = sharedConstructors.nginxReverseProxyPathBased { enableCache = true; };
  };
}
