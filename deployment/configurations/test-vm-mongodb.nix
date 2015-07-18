{ pkgs, ...}:

{
  networking.firewall.enable = false;
  services.mongodb.enable = true;
  services.mongodb.bind_ip = "0.0.0.0";
  services.disnix.enable = true;
  
  users.extraGroups = {
    nginx = { gid = 60; };
  };
  
  users.extraUsers = {
    nginx = { group = "nginx"; uid = 60; };
  };
  
  #virtualisation.memorySize = 2048;
  #virtualisation.diskSize = 8192;
}
