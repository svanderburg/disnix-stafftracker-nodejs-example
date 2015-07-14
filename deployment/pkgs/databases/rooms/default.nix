{stdenv}:

stdenv.mkDerivation {
  name = "rooms";
  buildCommand = ''
    mkdir -p $out/mongo-databases
    cp ${./createdb.js} $out/mongo-databases/createdb.js
  '';
}
