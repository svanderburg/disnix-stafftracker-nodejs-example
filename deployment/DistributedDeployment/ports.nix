{
  ports = {
    roomservice = 3001;
    staffservice = 3002;
    stafftracker = 3003;
    zipcodeservice = 3004;
  };
  portConfiguration = {
    globalConfig = {
      lastPort = 3004;
      minPort = 3000;
      maxPort = 4000;
      servicesToPorts = {
        zipcodeservice = 3004;
        roomservice = 3001;
        staffservice = 3002;
        stafftracker = 3003;
      };
    };
    targetConfigs = {
    };
  };
}
