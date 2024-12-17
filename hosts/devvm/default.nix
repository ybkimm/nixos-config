let
  add-user = import ../../utils/add-user;
in
{
  imports = [
    ./configuration.nix
    (add-user {
      userName = "root";
      homePath = "/root";
      homeConfigName = "default";
    })
    (add-user {
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

