{stdenv, stafftracker}:
{port}:
{zipcodeservice, staffservice, roomservice}:

stdenv.mkDerivation {
  name = "stafftracker-wrapper";
  buildCommand = ''
    mkdir -p $out/bin
    cat > $out/bin/run-stafftracker <<EOF
    #! ${stdenv.shell} -e

    # Configure the webservice URLs using the inter-dependency parameters
    export STAFFSERVICE_URL=http://${staffservice.target.hostname}:${toString staffservice.port}
    export ZIPCODESERVICE_URL=http://${zipcodeservice.target.hostname}:${toString zipcodeservice.port}
    export ROOMSERVICE_URL=http://${roomservice.target.hostname}:${toString roomservice.port}
    export PORT=${toString port}
    
    # Run the web application process
    ${stafftracker}/bin/stafftracker
    EOF
    chmod +x $out/bin/run-stafftracker
  '';
}
