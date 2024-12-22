let
  addUser = import ../../utils/addUser;
in
{
  imports = [
    ./configuration.nix
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

