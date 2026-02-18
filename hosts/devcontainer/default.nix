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
      homeConfigName = "ybkimm-dev";
      extraUserOptions = {
        isNormalUser = true;
        description = "Yongbin Kim";
        extraGroups = [ "wheel" ];
      };
    })
  ];
}
