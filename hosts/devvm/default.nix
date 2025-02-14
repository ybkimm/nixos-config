let
  addUser = import ../../utils/addUser;
in
{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix

    ./apps/fasm

    ./services/ssh3

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
        extraGroups = [ "wheel" ];
      };
    })
  ];
}

