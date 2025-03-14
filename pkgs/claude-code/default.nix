{ lib, stdenv, fetchurl, nodejs_23, ... }:
stdenv.mkDerivation rec {
  pname = "claude-code";
  version = "0.2.32";

  src = fetchurl {
    url = "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-${version}.tgz";
    hash = "sha512-BhVAlBGkgMbkiWPein6fADLgfZKakR9FQNYGzReSebvBxxQRy9jypYuuZgd+4p5RIYsOtyevlUltAm0KHDgs7A==";
  };

  nativeBuildInputs = [ nodejs_23 ];

  postPatch = ''
    substituteInPlace cli.mjs \
      --replace '#!/usr/bin/env -S node --no-warnings=ExperimentalWarning --enable-source-maps' \
      '#!${nodejs_23}/bin/node --no-warnings=ExperimentalWarning --enable-source-maps'
  '';

  installPhase = ''
    cp -r . $out/

    mkdir -p $out/bin
    ln -s $out/cli.mjs $out/bin/claude
  '';

  dontBuild = true;

  meta = {
    description = "Use Claude, Anthropic's AI assistant, right from your terminal. Claude can understand your codebase, edit files, run terminal commands, and handle entire workflows for you.";
    homepage = "https://github.com/anthropics/claude-code";
    license = "SEE LICENSE IN README.md";
  };
}
