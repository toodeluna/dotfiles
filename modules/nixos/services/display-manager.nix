{ pkgs, colorscheme, ... }:
let
  bg-color = colorscheme.base00;
  prestart-script = "${pkgs.coreutils}/bin/printf '%%b\\e]P0${bg-color}\\e]P7FFFFFF\\ec'";
in
{
  services.displayManager = {
    preStart = prestart-script;

    ly = {
      enable = true;

      settings = {
        vi_mode = true;
        clear_password = true;
        clock = "%D %H:%M";
        term_reset_cmd = "${pkgs.ncurses}/bin/tput reset; ${prestart-script}";
      };
    };
  };
}
