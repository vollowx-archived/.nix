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
    unzip # Zip tools

    # Developing tools
    nodePackages.pnpm
    gnumake

    # LSPs
    clang # C/C++
    nil # Nix
    lua-language-server
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.yaml-language-server
    marksman # Markdown
    ltex-ls # Spell checking

    # Formatters
    nodePackages.prettier
    stylua
    shfmt
    nixfmt
  ];
}
