{stdenv}:

stdenv.mkDerivation {
  name = "zipcodes";
  buildCommand = ''
    mkdir -p $out/mongo-database
    cp ${./createdb.js} $out/mongo-database/createdb.js
  '';
}
