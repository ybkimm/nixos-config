{
  lib,
  buildGoModule,
  fetchFromGitHub,
  libxcrypt
}:

buildGoModule rec {
  pname = "go-capnp";
  version = "3.0.1-alpha.2";

  src = fetchFromGitHub {
    owner = "capnproto";
    repo = "go-capnp";
    rev = "v${version}";
    hash = "sha256-AfEUhbIKJyZiZNzjMQ5tKvL6/mRUJc8TBe5LKKH9nSY=";
  };

  vendorHash = "sha256-yk2+rFNRrMH2iWnuatPyvPLvo9p1bDAihmda6i2zNV4=";
  subPackages = [
    "capnpc-go"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Cap'n Proto bindings for Go";
    homepage = "https://github.com/capnproto/go-capnp";
    changelog = "https://github.com/capnproto/go-capnp/releases/tag/${src.rev}";
    license = licenses.mit;
    mainProgram = "capnpc-go";
  };
}
