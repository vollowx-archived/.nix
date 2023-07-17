{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ zpty ];
  programs.zsh = {
    enable = true;
    autosuggestions = {
      enable = true;
      strategy = [ "history" "completion" ];
    };
    syntaxhighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" "pattern" "cursor" "regexp" "root" "line" ];
    };
  };
}
