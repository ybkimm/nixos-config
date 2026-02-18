{ config, pkgs, lib, ... }:

{
  system.build.tarball = pkgs.callPackage "${pkgs.path}/nixos/lib/make-system-tarball.nix" {
    fileName = "nixos-system-${config.networking.hostName}";
    contents = [];
    storeContents = [
      { object = config.system.build.toplevel; symlink = "none"; }
    ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.isContainer = true;

  networking.hostName = "devcontainer";
  networking.useDHCP = false;
  networking.useHostResolvConf = lib.mkDefault true;

  time.timeZone = "Asia/Tokyo";

  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    htop
  ];

  system.activationScripts.binbash = {
    deps = [ "binsh" ];
    text = ''
      ln -sf /bin/sh /bin/bash
    '';
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  networking.firewall.enable = false;

  system.stateVersion = "25.05";
}
