{ nixpkgs ? <nixpkgs>
, disnix_stafftracker_nodejs_example ? {outPath = ./.; rev = 1234;}
, officialRelease ? false
, systems ? [ "i686-linux" "x86_64-linux" ]
}:

let
  pkgs = import nixpkgs {};

  jobs = rec {
    tarball =
      let
        pkgs = import nixpkgs {};

        disnixos = import "${pkgs.disnixos}/share/disnixos/testing.nix" {
          inherit nixpkgs;
        };
      in
      disnixos.sourceTarball {
        name = "disnix-stafftracker-nodejs-example-tarball";
        version = builtins.readFile ./version;
        src = disnix_stafftracker_nodejs_example;
        inherit officialRelease;
      };

    build = {
      without_caching = pkgs.lib.genAttrs systems (system:
        let
          pkgs = import nixpkgs { inherit system; };

          disnixos = import "${pkgs.disnixos}/share/disnixos/testing.nix" {
            inherit nixpkgs system;
        };
        in
        disnixos.buildManifest {
          name = "disnix-stafftracker-nodejs-example";
          version = builtins.readFile ./version;
          inherit tarball;
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
          version = builtins.readFile ./version;
          inherit tarball;
          servicesFile = "deployment/DistributedDeployment/services-with-caching.nix";
          networkFile = "deployment/DistributedDeployment/network.nix";
          distributionFile = "deployment/DistributedDeployment/distribution.nix";
        }
      );
    };

    tests = let
      testScript = ''
        # Wait for a while and capture the output of the entry page
        my $result = $test3->mustSucceed("sleep 30; curl --fail http://test1");

        # The entry page should contain my name :-)

        if ($result =~ /Sander/) {
            print "Entry page contains Sander!\n";
        }
        else {
            die "Entry page should contain Sander!\n";
        }

        # Start Firefox and take a screenshot

        $test3->mustSucceed("firefox http://test1 &");
        $test3->waitForWindow(qr/Firefox/);
        $test3->mustSucceed("sleep 30");
        $test3->screenshot("screen");
      '';
    in
    {
      without_caching =
        let
          disnixos = import "${pkgs.disnixos}/share/disnixos/testing.nix" {
            inherit nixpkgs;
          };
        in
        disnixos.disnixTest {
          name = "disnix-stafftracker-nodejs-example-tests";
          inherit tarball;
          manifest = builtins.getAttr (builtins.currentSystem) (build.without_caching);
          networkFile = "deployment/DistributedDeployment/network.nix";
          inherit testScript;
        };
      with_caching =
        let
          disnixos = import "${pkgs.disnixos}/share/disnixos/testing.nix" {
            inherit nixpkgs;
          };
        in
        disnixos.disnixTest {
          name = "disnix-stafftracker-nodejs-example-tests";
          inherit tarball;
          manifest = builtins.getAttr (builtins.currentSystem) (build.with_caching);
          networkFile = "deployment/DistributedDeployment/network.nix";
          inherit testScript;
        };
    };
  };
in
jobs
