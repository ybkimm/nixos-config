{ ... }:
{
  services.davfs2 = {
    enable = true;
    settings = {
      globalSection = {
        use_locks = false;
      };
    };
  };

  sops.secrets."webdav/stash" = {
    mode = "0600";
    path = "/etc/davfs2/secrets";
  };

  #fileSystems."/mnt/stash" = {
  #  device = "https://stash.int";
  #  fsType = "davfs";
  #  options = [
  #    "_netdev"
  #    "noauto"
  #    "rw"
  #    "x-systemd.automount"
  #    "x-systemd.device-timeout=10"
  #  ];
  #};
}
