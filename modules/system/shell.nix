{ config, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestions = {
      enable = true;
      strategy = [ "history" "completion" ];
    };
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" "pattern" "regexp" "root" ];
    };
  };
}
