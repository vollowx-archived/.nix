{ configs, pkgs, ... }:

{
  imports =
    [
      ./_basic.nix
    ];

  environment.systemPackages = with pkgs; [
    wayland
    swaylock
    swayidle
    waybar
    wlogout
    wofi
    mako
    brightnessctl
    wdisplays
  ];

  security.polkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
