pkgs:
{
  bun = pkgs.callPackage ./bun { };
  freelens = pkgs.callPackage ./freelens { };
  graphics_gd = pkgs.callPackage ./graphics_gd { };
}
