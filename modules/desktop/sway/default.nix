{ pkgs, ... }:

{
  imports = [ ../_wayland.nix ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      wf-recorder
    ];
  };

  programs.nm-applet.enable = true;
  services.blueman.enable = true;
}
