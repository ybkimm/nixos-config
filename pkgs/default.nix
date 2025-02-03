pkgs:
{
  bun = pkgs.callPackage ./bun { };
  ssh3 = pkgs.callPackage ./ssh3 { };
  go-capnp = pkgs.callPackage ./go-capnp { };
}
