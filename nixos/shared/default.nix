{ config, ... }: {
  security.doas.enable = true;
  security.sudo.enable = false;

  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "random";
  };
  services.v2raya.enable = true;

  programs.git.enable = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = { LC_TIME = "en_US.UTF-8"; };
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];
  };
  time.timeZone = "Asia/Shanghai";
}
