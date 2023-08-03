{
  programs.git = {
    enable = true;
    lfs.enable = true;
    delta = {
      enable = true;
      options = {
        features = "decorations line-numbers";
        whitespace-error-style = "22 reverse";
        navigate = true;
        syntax-theme = "Catppuccin-mocha";
      };
    };
    extraConfig = { init = { defaultBranch = "main"; }; };
    userName = "vollowx";
    userEmail = "muffinslog@proton.me";
  };
  programs.lazygit = {
    enable = true;
    settings = {
      theme = let
        green = "#a6d189";
        text = "#c6d0f5";
        blue = "#090909";
        surface0 = "#414559";
        teal = "#81c8be";
      in {
        lightTheme = false;
        activeBorderColor = [ green "bold" ];
        inactiveBorderColor = [ text ];
        optionsTextColor = [ blue ];
        selectedLineBgColor = [ surface0 "default" ];
        selectedRangeBgColor = [ surface0 ];
        cherryPickedCommitBgColor = [ teal ];
        cherryPickedCommitFgColor = [ blue ];
        unstagedChangesColor = [ "red" ];
      };
    };
  };
}
