{ config, ... }: {
  security.doas.enable = true;
  security.sudo.enable = false;

  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "random";
  };
  services.v2raya.enable = true;

  programs.git.enable = true;
}
