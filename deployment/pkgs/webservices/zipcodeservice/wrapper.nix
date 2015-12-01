{stdenv, zipcodeservice}:
{port}:
{zipcodes}:

stdenv.mkDerivation {
  name = "zipcodeservice-wrapper";
  buildCommand = ''
    mkdir -p $out/bin
    cat > $out/bin/run-zipcodeservice <<EOF
    #! ${stdenv.shell} -e
    export ZIPCODESDB_URL=mongodb://${zipcodes.target.hostname}/${zipcodes.name} # Configure the URL of the Mongo database using inter-dependency parameters
    export PORT=${toString port}
    ${zipcodeservice}/bin/zipcodeservice
    EOF
    chmod +x $out/bin/run-zipcodeservice
    
    # Add configuration file that specifies under which user the process runs
    mkdir -p $out/etc
    cat > $out/etc/process_config <<EOF
    container_username=zipcodeservice
    container_group=zipcodeervice
    EOF
    
    # Restart the job when it accidentally terminates
    cat > $out/etc/systemd-config <<EOF
    Restart=always
    EOF
  '';
}
