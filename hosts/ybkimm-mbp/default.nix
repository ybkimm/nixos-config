let
  add-user = import ../../utils/add-user;
in
{
  imports = [
    ./configuration.nix
    (add-user {
      userName = "ybkimm";
      homePath = "/Users/ybkimm";
      homeConfigName = "ybkimm";
    })
  ];
}

