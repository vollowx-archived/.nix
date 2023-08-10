{
  programs.wofi = {
    enable = true;
    settings = {
      width = 400;
      height = 300;
      show = "drun";
      no_actions = true;
      insensitive = true;
      allow_images = true;
      image_size = 20;
    };
    style = ''
      window {
        margin: 0px;
        background-color: #181825;
        border: 2px solid #cba6f7;
        font-weight: bold;
        color: #cdd6f4;
      }

      #outer-box {
        padding: 2px;
      }

      #input {
        all: unset;
        margin-top: -20px;
      }

      #entry {
        all: unset;
        padding: 4px 8px;
      }

      #entry:selected {
        background: #45475a;
      }

      #text {
        margin: 0px 8px;
        color: #cdd6f4;
      }
    '';
  };
}
