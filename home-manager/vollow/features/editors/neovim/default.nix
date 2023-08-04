{ pkgs, ... }: {
  imports = [ ../shared ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    extraPackages = with pkgs; [ tree-sitter ];
  };
}
