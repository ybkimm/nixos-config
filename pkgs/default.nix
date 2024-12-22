pkgs:
{
  ssh3 = pkgs.callPackage ./ssh3 { };
  ssh3-server = pkgs.callPackage ./ssh3-server { };
}
