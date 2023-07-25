{ pkgs, ... }: {
  imports = [
    ./bash.nix
    ./fish.nix
    ./git.nix
    ./neovim.nix
    ./pfetch.nix
    ./ranger.nix
    ./starship.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    bc # Calculator
    bottom # System viewer
    ncdu # TUI disk usage
    exa # Better ls
    ripgrep # Better grep
    fd # Better find
    httpie # Better curl
    diffsitter # Better diff
    jq # JSON pretty printer and manipulator

    nil # Nix LSP
    nixfmt # Nix formatter

    ltex-ls # Spell checking LSP
  ];
}
