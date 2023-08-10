{ pkgs, ... }: {
  imports = [ ../shared ];

  home.packages = with pkgs; [ neovide ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    extraPackages = with pkgs; [ tree-sitter ];
  };
}
