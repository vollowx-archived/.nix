{ inputs, outputs, ... }: {
  # You can import other home-manager modules here
  imports = [
    ./shared

    # If you want to use modules your own flake exports (from modules/home-manager):
    outputs.homeManagerModules.browsers.chromium
    outputs.homeManagerModules.browsers.firefox
    outputs.homeManagerModules.desktops.sway
    outputs.homeManagerModules.terminals.foot
    outputs.homeManagerModules.games.minecraft
    outputs.homeManagerModules.ime.fcitx5.base
    outputs.homeManagerModules.ime.fcitx5.chinese
    outputs.homeManagerModules.ime.fcitx5.japanese

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default
  ];
}
