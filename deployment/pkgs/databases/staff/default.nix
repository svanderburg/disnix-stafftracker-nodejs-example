{stdenv}:

stdenv.mkDerivation {
  name = "staff";
  buildCommand = ''
    mkdir -p $out/mongo-databases
    cp ${./createdb.js} $out/mongo-databases/createdb.js
  '';
}
