{ config, pkgs, ... }: {
  services.mpd = {
    enable = true;
    musicDirectory = config.xdg.userDirs.music;
    extraConfig = ''
      audio_output {
        type  "pipewire"
        name  "PipeWire Sound Server"
      }

      audio_output {
        type   "fifo"
        name   "my_fifo"
        path   "/tmp/mpd.fifo"
        format "44100:16:2"
      }
    '';
  };

  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp.override { visualizerSupport = true; };
    settings = {
      user_interface = "alternative";
      playlist_display_mode = "columns";

      alternative_ui_separator_color = "black";
      alternative_header_first_line_format = "$b$5󰝚$/b  $b$8{%t}|{%f}$/b $/b";
      alternative_header_second_line_format =
        "{$b{$2󰳩  %a$9}{ - $7󰫔  %b$9}{ ($2%y$9)}}|{%D}";

      song_status_format = "$7%t";
      song_list_format = "  %t $R%a %l  ";
      song_library_format = "{{%a - %t} (%b)}|{%f}";
      song_columns_list_format = "(53)[white]{tr} (45)[blue]{a}";

      song_window_title_format = "{%a - }{%t}|{%f}";
      statusbar_visibility = "no";
      header_visibility = "no";
      titles_visibility = "no";

      progressbar_look = "▂▂▂";
      progressbar_color = "black";
      progressbar_elapsed_color = "yellow";

      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "fifo";
      visualizer_in_stereo = "yes";
      visualizer_type = "ellipse";
      visualizer_look = "󰧞󰧞";

      main_window_color = "blue";
      current_item_prefix = "$(blue)$r";
      current_item_suffix = "$/r$(end)";
      current_item_inactive_column_prefix = "$(red)$r";
      current_item_inactive_column_suffix = "$/r$(end)";
      color1 = "white";
      color2 = "red";
    };
  };
}
