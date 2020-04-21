{ pkgs, ...}:

{
  nixpkgs.config.allowUnfree = true; # MongoDB is covered by the SSPL which is not approved by the OSI and FSF

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
}
