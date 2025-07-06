# asian.nix -- Asian-specific configurations.
# Note that I am a Korean living in Japan.

{ pkgs, ... }:
{
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-mozc
      fcitx5-hangul
    ];
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.kimpanel
  ]; 
}
