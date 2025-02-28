pkgs:
{
  bun = pkgs.callPackage ./bun { };
  claude-code = pkgs.callPackage ./claude-code { };
  ssh3 = pkgs.callPackage ./ssh3 { };
  go-capnp = pkgs.callPackage ./go-capnp { };
}
