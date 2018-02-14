{stdenv, roomservice}:
{port}:
{rooms}:

stdenv.mkDerivation {
  name = "roomservice-wrapper";
  buildCommand = ''
    mkdir -p $out/bin
    cat > $out/bin/run-roomservice <<EOF
    #! ${stdenv.shell} -e
    export ROOMSDB_URL=mongodb://${rooms.target.properties.hostname} # Configure the URL of the Mongo database using inter-dependency parameters
    export ROOMSDB_NAME="${rooms.name}"
    export PORT=${toString port}
    ${roomservice}/bin/roomservice
    EOF
    chmod +x $out/bin/run-roomservice
    
    # Add configuration file that specifies under which user the process runs
    mkdir -p $out/etc
    cat > $out/etc/process_config <<EOF
    container_username=roomservice
    container_group=roomservice
    EOF
    
    # Restart the job when it accidentally terminates
    cat > $out/etc/systemd-config <<EOF
    Restart=always
    EOF
  '';
}
