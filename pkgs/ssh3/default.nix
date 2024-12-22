{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "ssh3";
  version = "0.1.7";

  src = fetchFromGitHub {
    owner = "francoismichel";
    repo = "ssh3";
    rev = "v${version}";
    hash = "sha256-ZtQAJwGvNlJWUoDa6bS3AEdM3zbNMPQGdaIhR+yIonw=";
  };

  vendorHash = "sha256-VUNvb7m1nnH+mXUsnIKyPKJEVSMXBAaS4ihi5DZeFiI=";
  subPackages = [ "cmd/ssh3" ];

  meta = with lib; {
    description = "Remote terminals over HTTP/3";
    homepage = "https://github.com/francoismichel/ssh3";
    changelog = "https://github.com/francoismichel/ssh3/releases/tag/${src.rev}";
    license = licenses.asl20;
    mainProgram = "ssh3";
  };
}
