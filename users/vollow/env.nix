{ config, ... }:

{
  home.sessionVariables = rec {
    EDITOR = "nvim";
    GIT_EDITOR = "nvim";
    TERMINAL = "kitty";
  };
}
