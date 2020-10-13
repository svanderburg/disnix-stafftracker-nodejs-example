{ nixpkgs ? <nixpkgs>
, disnix_stafftracker_nodejs_example ? {outPath = ./.; rev = 1234;}
, nix-processmgmt ? { outPath = ../nix-processmgmt; rev = 1234; }
, officialRelease ? false
, systems ? [ "i686-linux" "x86_64-linux" ]
}:

let
  pkgs = import nixpkgs {};

  disnixos = import "${pkgs.disnixos}/share/disnixos/testing.nix" {
    inherit nixpkgs;
  };

  version = builtins.readFile ./version;

  jobs = rec {
    tarball = disnixos.sourceTarball {
      name = "disnix-stafftracker-nodejs-example-tarball";
      src = disnix_stafftracker_nodejs_example;
      inherit officialRelease version;
    };

    build =
      let
        extraParams = { inherit nix-processmgmt; };
      in
      {
        without_caching = pkgs.lib.genAttrs systems (system:
          let
            pkgs = import nixpkgs { inherit system; };

            disnixos = import "${pkgs.disnixos}/share/disnixos/testing.nix" {
              inherit nixpkgs system;
          };
          in
          disnixos.buildManifest {
            name = "disnix-stafftracker-nodejs-example";
            inherit tarball version extraParams;
            servicesFile = "deployment/DistributedDeployment/services.nix";
            networkFile = "deployment/DistributedDeployment/network.nix";
            distributionFile = "deployment/DistributedDeployment/distribution.nix";
          }
        );

        with_caching = pkgs.lib.genAttrs systems (system:
          let
            pkgs = import nixpkgs { inherit system; };

            disnixos = import "${pkgs.disnixos}/share/disnixos/testing.nix" {
              inherit nixpkgs system;
          };
          in
          disnixos.buildManifest {
            name = "disnix-stafftracker-nodejs-example";
            inherit tarball version extraParams;
            servicesFile = "deployment/DistributedDeployment/services-with-caching.nix";
            networkFile = "deployment/DistributedDeployment/network.nix";
            distributionFile = "deployment/DistributedDeployment/distribution.nix";
          }
        );

        with_containers = pkgs.lib.genAttrs systems (system:
          let
            pkgs = import nixpkgs { inherit system; };

            disnixos = import "${pkgs.disnixos}/share/disnixos/testing.nix" {
              inherit nixpkgs system;
          };
          in
          disnixos.buildManifest {
            name = "disnix-stafftracker-nodejs-example";
            inherit tarball version extraParams;
            servicesFile = "deployment/DistributedDeployment/services-with-containers.nix";
            networkFile = "deployment/DistributedDeployment/network-bare.nix";
            distributionFile = "deployment/DistributedDeployment/distribution-with-containers.nix";
          }
        );
      };

    tests =
      let
        testScript = ''
          # Wait for a while and capture the output of the entry page
          result = test3.succeed("sleep 30; curl --fail http://test1")

          # The entry page should contain my name :-)

          if "Sander" in result:
              print("Entry page contains Sander!")
          else:
              raise Exception("Entry page should contain Sander!")

          # Start Firefox and take a screenshot

          test3.succeed("firefox http://test1 &")
          test3.wait_for_window("Firefox")
          test3.succeed("sleep 30")
          test3.screenshot("screen")
        '';
      in
      {
        without_caching = disnixos.disnixTest {
          name = "disnix-stafftracker-nodejs-example-tests";
          inherit tarball testScript;
          manifest = builtins.getAttr (builtins.currentSystem) (build.without_caching);
          networkFile = "deployment/DistributedDeployment/network.nix";
        };

        with_caching = disnixos.disnixTest {
          name = "disnix-stafftracker-nodejs-example-tests";
          inherit tarball testScript;
          manifest = builtins.getAttr (builtins.currentSystem) (build.with_caching);
          networkFile = "deployment/DistributedDeployment/network.nix";
        };

        with_containers = disnixos.disnixTest {
          name = "disnix-stafftracker-nodejs-example-tests";
          inherit tarball testScript;
          manifest = builtins.getAttr (builtins.currentSystem) (build.with_containers);
          networkFile = "deployment/DistributedDeployment/network-bare.nix";
        };
      };
  };
in
jobs
