{ lib, pkgs, config, ... }:
{
  options.services.ssh3 = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Whether to enable the ssh3 service or not.
      '';
    };

    interface = lib.mkOption {
      default = "eth0";
      description = ''
        Which interface to bind the ssh3 server to.
        The IP address of this interface will be used.
      '';
    };

    port = lib.mkOption {
      default = "443";
      description = ''
        Port to listen the request from.
        Default is 443.
      '';
    };

    url-path = lib.mkOption {
      default = "/ssh3-term";
      description = ''
        The secret URL path on which the ssh3 server listens
      '';
    };
  };

  config = lib.mkIf config.services.ssh3.enable {
    environment.systemPackages = with pkgs; [
      ssh3
    ];

    systemd.services.ssh3-server = {
      enable = true;

      path = [ pkgs.iproute2 pkgs.gawk pkgs.coreutils ];

      description = "Remote terminal over HTTP/3";
      wantedBy = [ "multi-user.target" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];

      serviceConfig = {
        ExecStart = "${pkgs.writeShellScriptBin "ssh3-start" ''
          #!/usr/bin/env bash
          IFACE="${config.services.ssh3.interface}"
          IP=$(ip -4 addr show dev "$IFACE" | grep "inet " | head -n1 | awk '{print $2}' | cut -d/ -f1)

          if [ -z "$IP" ]; then
            IP="0.0.0.0"
          fi

          exec ${pkgs.ssh3}/bin/ssh3-server \
            -bind 0.0.0.0:${config.services.ssh3.port} \
            -cert /etc/ssh3/cert.pem \
            -key  /etc/ssh3/key.pem \
            -url-path ${config.services.ssh3.url-path}
        ''}/bin/ssh3-start";
        Restart = "always";
      };
    };

    networking.firewall = {
      allowedUDPPorts = [ 443 ];
    };
  };
}
