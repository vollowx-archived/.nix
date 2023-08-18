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
  programs.lazygit = { enable = true; };
}
