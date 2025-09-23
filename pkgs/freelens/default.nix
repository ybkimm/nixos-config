# https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/le/lens/package.nix

{ stdenv, callPackage, fetchurl, lib }:

let
  pname = "freelens";
  version = "1.5.3";

  sources = {
    x86_64-linux = {
      url = "https://github.com/freelensapp/freelens/releases/download/v${version}/Freelens-${version}-linux-amd64.AppImage";
      hash = "sha256-I6jmMGCkkdZPJoLNGfWhUc5SAjNcRzPJsVckxZ6eeng=";
    };
  };

  src = fetchurl {
    inherit (sources.${stdenv.system} or (throw "Unsupported system: ${stdenv.system}")) url hash;
  };

  meta = with lib; {
    description = "Free IDE for Kubernetes";
    homepage = "https://freelens.app/";
    license = licenses.mit;
    platforms = builtins.attrNames sources;
  };

in
if stdenv.hostPlatform.isDarwin then
  callPackage ./darwin.nix {
    inherit
      pname
      version
      src
      meta
      ;
  }
else
  callPackage ./linux.nix {
    inherit
      pname
      version
      src
      meta
      ;
  }

