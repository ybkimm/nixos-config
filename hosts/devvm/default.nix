let
  addUser = import ../../utils/addUser;
in
{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix

    ./services/ssh3
    ./services/tmux

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

