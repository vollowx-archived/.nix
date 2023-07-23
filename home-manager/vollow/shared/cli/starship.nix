{ config, ... }: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };
}
