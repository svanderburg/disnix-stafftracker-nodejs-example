{stdenv}:

stdenv.mkDerivation {
  name = "rooms";
  buildCommand = ''
    mkdir -p $out/mongo-database
    cp ${./createdb.js} $out/mongo-database/createdb.js
  '';
}
