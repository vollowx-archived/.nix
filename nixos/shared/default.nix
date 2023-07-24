{ config, ... }: {
  security.doas.enable = true;
  security.sudo.enable = false;

  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "random";
  };

  programs.git.enable = true;
}
