{ config, lib, ... }: {
  networking = {
    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
    };

    firewall = {
      enable = true;
      allowPing = false;
      logReversePathDrops = true;
    };
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  services.v2raya.enable = true;
}
