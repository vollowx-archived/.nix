{ pkgs, ... }: {
  imports = [
    ./bash.nix
    ./bat.nix
    ./exa.nix
    ./fish.nix
    ./git.nix
    ./lf.nix
    ./pfetch.nix
    ./starship.nix
    ./tty-clock.nix
    ./xdg.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    bc # Calculator
    bottom # System viewer
    file # File info
    ncdu # TUI disk usage
    ripgrep # Better grep
    fd # Better find
    jq # JSON pretty printer and manipulator
    unzip # Zip tools

    # Developing tools
    nodePackages.pnpm
    gnumake
    clang
  ];
}
