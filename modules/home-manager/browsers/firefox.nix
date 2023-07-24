{
  programs.firefox = {
    enable = true;
    profiles.anyone = {
      isDefault = true;
      name = "Anyone";
    };
  };
}
