{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ zpty ];
  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
      strategy = [ "history", "completion" ];
    };
    syntaxhighlighting = {
      enable = true;
      highlighters = [ "main", "brackets", "pattern", "cursor", "regexp", "root", "line" ];
    };
  };
}
