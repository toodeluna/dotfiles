final: prev:
let
  set = "Custom";

  iosevka-custom = prev.iosevka.override {
    set = set;

    privateBuildPlan = {
      family = "Iosevka ${set}";
      spacing = "normal";
      serifs = "sans";
      noCsSs = true;
      exportGlyphNames = false;
      noLigation = true;

      variants.design = {
        asterisk = "penta-low";
        paren = "normal";
        brace = "curly";
        ampersand = "et-toothed";
        at = "fourfold";
        dollar = "open";
        cent = "open";
        percent = "rings-continuous-slash";
      };

      weights = {
        Regular = {
          shape = 400;
          menu = 400;
          css = 400;
        };

        SemiBold = {
          shape = 600;
          menu = 600;
          css = 600;
        };
      };

      widths = {
        Condensed = {
          shape = 500;
          menu = 3;
          css = "condensed";
        };

        Normal = {
          shape = 600;
          menu = 5;
          css = "normal";
        };
      };

      slopes = {
        Upright = {
          angle = 0;
          shape = "upright";
          menu = "upright";
          css = "normal";
        };

        Italic = {
          angle = 9.4;
          shape = "italic";
          menu = "italic";
          css = "italic";
        };
      };
    };
  };

  iosevka-custom-patched = prev.stdenv.mkDerivation {
    name = "iosevka-custom-nerd-font";
    src = iosevka-custom;
    buildInputs = [
      iosevka-custom
      prev.nerd-font-patcher
    ];

    buildPhase = ''
      find \( -name \*.ttf -o -name \*.otf \) -execdir nerd-font-patcher -c {} \;
    '';

    installPhase = ''
      cp -a . $out
    '';
  };
in
{
  iosevka = iosevka-custom-patched;
}
