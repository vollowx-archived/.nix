{ config, pkgs, ... }:

{
  imports =
    [
      ../_wayland.nix
    ];
}
