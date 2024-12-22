let
  addUser = import ../../utils/addUser;
in
{
  imports = [
    ./configuration.nix
    (addUser {
      userName = "ybkimm";
      homePath = "/Users/ybkimm";
      homeConfigName = "ybkimm";
    })
  ];
}

