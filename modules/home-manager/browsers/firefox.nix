{
  programs.firefox = {
    enable = true;
    profiles.anyone = {
      isDefault = true;
      name = "anyone";
      search.default = "DuckDuckGo";
    };
  };
}
