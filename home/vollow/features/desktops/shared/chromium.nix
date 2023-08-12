{
  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "clngdbkpkpeebahjckkjfobafhncgmne" # stylus
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock
      "jghecgabfgfdldnmbfkhmffcabddioke" # Volume Master
    ];
    commandLineArgs = [
      "--force-dark-mode"
      "--enable-gpu-rasterization"
      "--enable-oop-rasterization"
      "--enable-zero-copy"
      "--ignore-gpu-blocklist"
      "--no-default-browser-check"
      "--no-service-autorun"
      "--disable-features=PreloadMediaEngagementData,MediaEngagementBypassAutoplayPolicies"
      "--disable-reading-from-canvas"
      "--no-pings"
      "--no-first-run"
      "--no-experiments"
      "--no-crash-upload"
      "--disable-wake-on-wifi"
      "--disable-breakpad"
      "--disable-sync"
      "--disable-speech-api"
      "--disable-speech-synthesis-api"
      "--ozone-platform=wayland"
      "--enable-features=UseOzonePlatform,WebUIDarkMode,TouchpadOverscrollHistoryNavigation,VaapiVideoDecoder"
    ];
  };
}
