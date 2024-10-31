{ ... }:
{
  services.displayManager.ly = {
    enable = true;

    settings = {
      vi_mode = true;
      clear_password = true;
      clock = "%D %H:%M";
    };
  };
}
