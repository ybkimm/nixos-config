let
  addUser = import ../../utils/addUser;
in
{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix

    ./asian.nix
    ./gaming.nix

    (addUser {
      userName = "root";
      homePath = "/root";
      homeConfigName = "default";
    })
    (addUser {
      userName = "ybkimm";
      homePath = "/home/ybkimm";
      homeConfigName = "ybkimm";
      extraUserOptions = {
        isNormalUser = true;
        description = "Yongbin Kim";
        extraGroups = [ "wheel", "networkmanager" ];
      };
    });
  ];
}
