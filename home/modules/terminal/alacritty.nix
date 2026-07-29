# Alacritty - GPU accelerated terminal
{ pkgs, ... }:

{
  home.packages = [
    pkgs.maple-mono.NF
    pkgs.noto-fonts-color-emoji
    pkgs.zellij
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts.emoji = [ "Noto Color Emoji" ];
    configFile.emoji-fallback = {
      enable = true;
      priority = 90;
      settings = {
        description = "Fallback to color emoji glyphs for the terminal font";
        match = {
          "@target" = "pattern";
          test = {
            "@name" = "family";
            "@qual" = "any";
            string = "Maple Mono NF";
          };
          edit = {
            "@name" = "family";
            "@mode" = "append";
            "@binding" = "same";
            string = "Noto Color Emoji";
          };
        };
      };
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "Maple Mono NF";
        };
        size = 12.0;
      };

      # Dracula color scheme
      colors = {
        primary = {
          background = "0x282a36";
          foreground = "0xf8f8f2";
        };
        cursor = {
          text = "0x282a36";
          cursor = "0xf8f8f2";
        };
        normal = {
          black = "0x000000";
          red = "0xff5555";
          green = "0x50fa7b";
          yellow = "0xf1fa8c";
          blue = "0xbd93f9";
          magenta = "0xff79c6";
          cyan = "0x8be9fd";
          white = "0xf8f8f2";
        };
        bright = {
          black = "0x6272a4";
          red = "0xff6e6e";
          green = "0x69ff94";
          yellow = "0xffffa5";
          blue = "0xd6acff";
          magenta = "0xff92df";
          cyan = "0xa4ffff";
          white = "0xffffff";
        };
      };

      # Launch zellij on every new window
      terminal = {
        shell = {
          program = "zellij";
        };
      };
    };
  };
}
