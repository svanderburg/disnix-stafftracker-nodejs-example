{stdenv, roomservice}:
{port}:
{rooms}:

stdenv.mkDerivation {
  name = "roomservice-wrapper";
  buildCommand = ''
    mkdir -p $out/bin
    cat > $out/bin/run-roomservice <<EOF
    #! ${stdenv.shell} -e
    export ROOMSDB_URL=mongodb://${rooms.target.hostname}/${rooms.name} # Configure the URL of the Mongo database using inter-dependency parameters
    export PORT=${toString port}
    ${roomservice}/bin/roomservice
    EOF
    chmod +x $out/bin/run-roomservice
  '';
}
