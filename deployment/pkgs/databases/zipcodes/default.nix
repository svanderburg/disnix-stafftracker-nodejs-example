{stdenv}:

stdenv.mkDerivation {
  name = "zipcodes";
  buildCommand = ''
    mkdir -p $out/mongo-databases
    cp ${./createdb.js} $out/mongo-databases/createdb.js
  '';
}
