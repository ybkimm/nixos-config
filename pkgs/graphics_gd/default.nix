{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "gd";
  version = "unstable-${src.rev}";

  src = fetchFromGitHub {
    owner = "quaadgras";
    repo = "graphics.gd";
    rev = "9b8b2467f2082f59d12b6d1b4c4ecc985b808ab3";
    hash = "sha256-37neoE8jdocAPUv6I7ow+ColCaIL1VeJHDehapsWJ5s=";
  };

  patches = [
    ./toolchain.patch
  ];

  vendorHash = "sha256-QCRMmKfgp1SEDBIXWNH1rBJ+0+VWFX2BGBHa9qIP5cQ=";

  subPackages = [ "cmd/gd" ];

  meta = with lib; {
    description = "graphics.gd command line tool";
    homepage = "https://github.com/quaadgras/graphics.gd";
    license = licenses.mit;
  };
}
