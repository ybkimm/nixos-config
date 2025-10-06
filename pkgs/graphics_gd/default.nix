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
    rev = "5551445f1046d8c359cfb9d4e53c450b55668edd";
    hash = "sha256-Rko0DLRt7qeEI9tZ4NSlsR5mL1gj1jNJIsm6oPwkV/E=";
  };

  patches = [
    ./toolchain.patch
    ./web-https.patch
  ];

  vendorHash = "sha256-RpUoZs3SsF8q/YytDAEk3eCu27Rvk6RyyLdkqWndeZM=";

  subPackages = [ "cmd/gd" ];

  meta = with lib; {
    description = "graphics.gd command line tool";
    homepage = "https://github.com/quaadgras/graphics.gd";
    license = licenses.mit;
  };
}
