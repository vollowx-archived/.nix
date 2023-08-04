{
  security.doas.enable = true;
  security.sudo.enable = false;
  security.pam.services.swaylock = { text = "auth include login"; };
}
