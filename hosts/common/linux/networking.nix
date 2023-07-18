{ ... }:

{
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  services.v2raya.enable = true;
}
