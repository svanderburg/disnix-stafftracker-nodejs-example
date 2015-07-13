{stdenv, staffservice}:
{port}:
{staff}:

stdenv.mkDerivation {
  name = "staffservice-wrapper";
  buildCommand = ''
    mkdir -p $out/bin
    cat > $out/bin/run-staffservice <<EOF
    #! ${stdenv.shell} -e
    export STAFFDB_URL=mongodb://${staff.target.hostname}/${staff.name} # Configure the URL of the Mongo database using inter-dependency parameters
    export PORT=${toString port}
    ${staffservice}/bin/staffservice
    EOF
    chmod +x $out/bin/run-staffservice
  '';
}
