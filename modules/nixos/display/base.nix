{ pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-extra
      noto-fonts-emoji
      (nerdfonts.override { fonts = [ "ComicShannsMono" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [
          "ComicShannsMono Nerd Font"
          "Noto Sans Mono CJK SC"
          "Noto Color Emoji"
        ];
        sansSerif = [ "Noto Sans" "Noto Sans CJK SC" "Noto Color Emoji" ];
        serif = [ "Noto Serif" "Noto Serif CJK SC" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
