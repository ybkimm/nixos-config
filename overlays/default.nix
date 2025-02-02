# This file defines overlays
{ inputs, ... }: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs final.pkgs;

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
    bun = prev.bun.overrideAttrs (oldAttrs: rec {
      version = "1.2.2";
      passthru = oldAttrs.passthru // {
        sources = {
          "aarch64-darwin" = oldAttrs.passthru.sources."aarch64-darwin" // {
            hash = "sha256-xNWOBsXDOIW1JvTZGjjKnr25/D+0zVR/fTMCBVyY5Bw=";
          };
          "aarch64-linux" = oldAttrs.passthru.sources."aarch64-linux" // {
            hash = "sha256-0duqPpryRUn62Svb5Psh+lMwLNBIqPAE6FokCYTJPU0=";
          };
          "x86_64-darwin" = oldAttrs.passthru.sources."x86_64-darwin" // {
            hash = "sha256-0duqPpryRUn62Svb5Psh+lMwLNBIqPAE6FokCYTJPU0=";
          };
          "x86_64-linux" = oldAttrs.passthru.sources."x86_64-linux" // {
            hash = "sha256-P077iv0fhKwqmMBGYciYVh0dNVJ9Awy0Vx6Zt8hfUHk=";
          };
        };
      };
    });
  };
}
