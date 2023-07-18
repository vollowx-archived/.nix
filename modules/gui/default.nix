{ pkgs, ... }:

{
  imports =
    [
      ./firefox.nix
      ./gtk.nix
    ];

  home.packages =
    with pkgs; [
      system-config-printer
    ];
}
