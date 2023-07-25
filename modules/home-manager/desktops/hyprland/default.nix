{
  imports = [ ../shared ../shared/wayland ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    xwayland.enable = true;

    extraConfig = ''
      # Definitions
      $rosewaterAlpha = f5e0dc
      $flamingoAlpha  = f2cdcd
      $pinkAlpha      = f5c2e7
      $mauveAlpha     = cba6f7
      $redAlpha       = f38ba8
      $maroonAlpha    = eba0ac
      $peachAlpha     = fab387
      $yellowAlpha    = f9e2af
      $greenAlpha     = a6e3a1
      $tealAlpha      = 94e2d5
      $skyAlpha       = 89dceb
      $sapphireAlpha  = 74c7ec
      $blueAlpha      = 89b4fa
      $lavenderAlpha  = b4befe

      $textAlpha      = cdd6f4
      $subtext1Alpha  = bac2de
      $subtext0Alpha  = a6adc8

      $overlay2Alpha  = 9399b2
      $overlay1Alpha  = 7f849c
      $overlay0Alpha  = 6c7086

      $surface2Alpha  = 585b70
      $surface1Alpha  = 45475a
      $surface0Alpha  = 313244

      $baseAlpha      = 1e1e2e
      $mantleAlpha    = 181825
      $crustAlpha     = 11111b

      $rosewater = 0xfff5e0dc
      $flamingo  = 0xfff2cdcd
      $pink      = 0xfff5c2e7
      $mauve     = 0xffcba6f7
      $red       = 0xfff38ba8
      $maroon    = 0xffeba0ac
      $peach     = 0xfffab387
      $yellow    = 0xfff9e2af
      $green     = 0xffa6e3a1
      $teal      = 0xff94e2d5
      $sky       = 0xff89dceb
      $sapphire  = 0xff74c7ec
      $blue      = 0xff89b4fa
      $lavender  = 0xffb4befe

      $text      = 0xffcdd6f4
      $subtext1  = 0xffbac2de
      $subtext0  = 0xffa6adc8

      $overlay2  = 0xff9399b2
      $overlay1  = 0xff7f849c
      $overlay0  = 0xff6c7086

      $surface2  = 0xff585b70
      $surface1  = 0xff45475a
      $surface0  = 0xff313244

      $base      = 0xff1e1e2e
      $mantle    = 0xff181825
      $crust     = 0xff11111b

      # Environment
      env = WLR_RENDERER, vulkan
      env = XDG_CURRENT_DESKTOP, Hyprland

      # Main
      monitor = , preferred, auto, 1

      input {
        kb_layout = us

        repeat_rate = 30
        repeat_delay = 200

        touchpad {
          natural_scroll = true
          disable_while_typing = false
        }

        sensitivity = 0
      }

      general {
        gaps_in = 5
        gaps_out = 10
        border_size = 2
        col.active_border = $pink
        col.inactive_border = $surface0
        no_border_on_floating = true

        layout = dwindle
      }

      misc {
        disable_hyprland_logo = true
        disable_splash_rendering = true
        disable_autoreload = true
        mouse_move_enables_dpms = true
        enable_swallow = true
        swallow_regex = ^(foot)$
      }

      decoration {
        rounding = 0
        multisample_edges = true

        active_opacity = 1.0
        inactive_opacity = 1.0

        blur = false
        blur_size = 10
        blur_passes = 4
        blur_ignore_opacity = false
        blur_new_optimizations = on

        blurls = gtk-layer-shell
        blurls = waybar

        drop_shadow = true
        shadow_ignore_window = true
        shadow_offset = 0 2
        shadow_range = 4
        shadow_render_power = 2
        col.shadow = 0x66000000
      }

      animations {
        enabled = true

        animation = workspaces, 1, 3, default, slidevert
        animation = windows,    1, 3, default, slide
        animation = border,     1, 3, default
        animation = fade,       1, 3, default
      }

      dwindle {
        pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true # you probably want this
      }

      master {
        new_is_master = true
      }

      gestures {
        workspace_swipe = on
        workspace_swipe_distance = 250
        workspace_swipe_invert = true
        workspace_swipe_min_speed_to_force = 15
        workspace_swipe_cancel_ratio = 0.5
        workspace_swipe_create_new = false
      }

      # Keymaps
      bind = SUPER, escape, exec, wlogout
      bind = SUPER, x, exec, swaylock -f
      bind = SUPER SHIFT, v, exec, clipman pick --tool=wofi
      bind = SUPER, o, exec, hyprpicker -a -n

      bind = SUPER, return, exec, foot
      bind = SUPER, d, exec, wofi --show drun
      bind = SUPER SHIFT, q, killactive,
      bind = SUPER SHIFT, e, exit,
      bind = SUPER SHIFT, space, togglefloating,
      bind = SUPER, f, fullscreen,
      bind = SUPER SHIFT, p, pin,
      bind = SUPER SHIFT, c, reload
      bind = SUPER, e, togglesplit, # dwindle

      bind = SUPER, h, movefocus, l
      bind = SUPER, l, movefocus, r
      bind = SUPER, k, movefocus, u
      bind = SUPER, j, movefocus, d

      bind = SUPER SHIFT, h, movewindow, l
      bind = SUPER SHIFT, l, movewindow, r
      bind = SUPER SHIFT, k, movewindow, u
      bind = SUPER SHIFT, j, movewindow, d

      bind = SUPER, 1, workspace, 1
      bind = SUPER, 2, workspace, 2
      bind = SUPER, 3, workspace, 3
      bind = SUPER, 4, workspace, 4
      bind = SUPER, 5, workspace, 5
      bind = SUPER, 6, workspace, 6
      bind = SUPER, 7, workspace, 7
      bind = SUPER, 8, workspace, 8
      bind = SUPER, 9, workspace, 9

      bind = SUPER SHIFT, 1, movetoworkspacesilent, 1
      bind = SUPER SHIFT, 2, movetoworkspacesilent, 2
      bind = SUPER SHIFT, 3, movetoworkspacesilent, 3
      bind = SUPER SHIFT, 4, movetoworkspacesilent, 4
      bind = SUPER SHIFT, 5, movetoworkspacesilent, 5
      bind = SUPER SHIFT, 6, movetoworkspacesilent, 6
      bind = SUPER SHIFT, 7, movetoworkspacesilent, 7
      bind = SUPER SHIFT, 8, movetoworkspacesilent, 8
      bind = SUPER SHIFT, 9, movetoworkspacesilent, 9

      bind = SUPER, minus, movetoworkspacesilent, special
      bind = SUPER, equal, togglespecialworkspace

      bind = SUPER, mouse_down, workspace, e+1
      bind = SUPER, mouse_up, workspace, e-1

      bindm = SUPER, mouse:272, movewindow
      bindm = SUPER, mouse:273, resizewindow

      # bindle = , XF86AudioRaiseVolume, exec, wmctl v+
      # bindle = , XF86AudioLowerVolume, exec, wmctl v-
      # bindle = , XF86AudioMute, exec, wmctl vm
      # bindle = , XF86MonBrightnessUp, exec, wmctl b+
      # bindle = , XF86MonBrightnessDown, exec, wmctl b-
      # bind = , print, exec, grimblast --notify copy area
      # bind = CTRL, print, exec, grimblast --notify save screen
      # bind = SHIFT, print, exec, grimblast --notify save area

      # resize
      bind = SUPER, r, submap, resize
      submap = resize
        binde = , h, resizeactive, -10 0
        binde = , l, resizeactive, 10 0
        binde = , k, resizeactive, 0 -10
        binde = , j, resizeactive, 0 10

        bind = SUPER, r, submap, reset
        bind = , return, submap, reset
        bind = , escape, submap, reset
      submap = reset

      bind = SUPER, m, submap, move
      submap = move
        binde = , h, moveactive, -10 0
        binde = , l, moveactive, 10 0
        binde = , k, moveactive, 0 -10
        binde = , j, moveactive, 0 10

        bind = SUPER, m, submap, reset
        bind = , return, submap, reset
        bind = , escape, submap, reset
      submap = reset
    '';
  };
}
