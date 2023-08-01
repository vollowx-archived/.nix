{ inputs, outputs, ... }: {
  # You can import other home-manager modules here
  imports = [
    ./shared

    # If you want to use modules your own flake exports (from modules/home-manager):
    outputs.homeManagerModules.browsers.chromium
    outputs.homeManagerModules.browsers.edge-dev
    outputs.homeManagerModules.browsers.firefox
    outputs.homeManagerModules.desktops.sway
    outputs.homeManagerModules.games.minecraft
    outputs.homeManagerModules.ime.fcitx5.base
    outputs.homeManagerModules.ime.fcitx5.chinese
    outputs.homeManagerModules.ime.fcitx5.japanese
    outputs.homeManagerModules.misc.tty-clock
    outputs.homeManagerModules.terminals.foot

    # Or modules exported from other flakes (such as nix-colors):
    inputs.nix-colors.homeManagerModules.default
  ];

  colorscheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
}
