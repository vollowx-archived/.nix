{
  imports = [ ./_home.nix ];
  home.sessionVariables = {
    # Wayland
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    # Firefox
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_WEBRENDER = "1";
    # QT
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    # Java
    _JAVA_AWT_WM_NONREPARENTING = "1";
    # Fcitx5
    GLFW_IM_MODULE = "fcitx";
    GTK_IM_MODULE = "fcitx";
    INPUT_METHOD = "fcitx";
    XMODIFIERS = "@im=fcitx";
    IMSETTINGS_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
  };
}
