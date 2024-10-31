{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    work-sans
    noto-fonts-cjk-sans
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
  ];
}
