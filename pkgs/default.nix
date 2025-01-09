pkgs:
{
  ssh3 = pkgs.callPackage ./ssh3 { };
  go-capnp = pkgs.callPackage ./go-capnp { };
}
