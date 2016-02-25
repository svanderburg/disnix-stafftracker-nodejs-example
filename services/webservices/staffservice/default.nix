{pkgs ? import <nixpkgs> {
    inherit system;
  }, system ? builtins.currentSystem}:

let
  nodeEnv = import ../../node-env.nix {
    inherit (pkgs) stdenv python utillinux runCommand writeTextFile nodejs;
  };
in
import ./node-packages.nix {
  inherit (pkgs) fetchurl fetchgit;
  inherit nodeEnv;
}