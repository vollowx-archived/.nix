{ inputs, ... }: {
  # You can import other home-manager modules here
  imports = [
    ./shared.nix

    ./features/desktops/sway
    ./features/editors/neovim
    ./features/games

    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.module

    # Or modules exported from other flakes (such as nix-colors):
    inputs.nix-colors.homeManagerModules.default
  ];

  colorscheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
}
