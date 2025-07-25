# ncspot - An ncurses Spotify client
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ncspot
  ];

  # Default ncspot configuration
  xdg.configFile."ncspot/config.toml".text = ''
    [audio]
    volnorm = true
    gapless = true
    bitrate = 320

    [ui]
    use_nerdfont = true

    [theme]
    background = "#1e1e2e"          # Catppuccin Mocha Base
    primary = "#cdd6f4"             # Catppuccin Mocha Text
    secondary = "#6c7086"           # Catppuccin Mocha Overlay1
    title = "#a6e3a1"               # Catppuccin Mocha Green
    playing = "#a6e3a1"             # Catppuccin Mocha Green
    playing_selected = "#94e2d5"    # Catppuccin Mocha Teal
    playing_bg = "#1e1e2e"          # Catppuccin Mocha Base
    highlight = "#b4befe"           # Catppuccin Mocha Lavender
    highlight_bg = "#313244"        # Catppuccin Mocha Surface0
    error = "#eba0ac"               # Catppuccin Mocha Maroon
    error_bg = "#1e1e2e"            # Catppuccin Mocha Base
    statusbar = "#a6e3a1"           # Catppuccin Mocha Green
    statusbar_progress = "#b4befe"  # Catppuccin Mocha Lavender
    statusbar_bg = "#313244"        # Catppuccin Mocha Surface0
    cmdline = "#cdd6f4"             # Catppuccin Mocha Text
    cmdline_bg = "#1e1e2e"          # Catppuccin Mocha Base
    search_match = "#f9e2af"        # Catppuccin Mocha Yellow
  '';
}
