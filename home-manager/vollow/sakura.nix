{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    ./shared

    # If you want to use modules your own flake exports (from modules/home-manager):
    outputs.homeManagerModules.browsers.firefox
    outputs.homeManagerModules.desktops.hyprland
    outputs.homeManagerModules.desktops.sway
    outputs.homeManagerModules.terminals.foot

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default
  ];
}
