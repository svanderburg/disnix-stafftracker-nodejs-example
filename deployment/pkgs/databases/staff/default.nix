{stdenv}:

stdenv.mkDerivation {
  name = "staff";
  buildCommand = ''
    mkdir -p $out/mongo-database
    cp ${./createdb.js} $out/mongo-database/createdb.js
  '';
}
