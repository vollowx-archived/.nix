{ pkgs, ... }:

{
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = { addons = with pkgs; [ fcitx5-chinese-addons ]; };
  };
  home.file.".config/fcitx5/conf/classicui.conf".source =
    ../../conf/fcitx5/classicui.conf;
  home.file.".local/share/fcitx5/themes/catppuccin-mocha/theme.conf".text =
    import ../../conf/fcitx5/theme.nix;
}
