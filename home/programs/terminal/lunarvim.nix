# LunarVim - a Neovim distribution with all dependencies
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lunarvim

    # Dependencies
    fd
    git
    gnumake
    lazygit
    nodejs
    python3
    python3Packages.pip
    ripgrep
    rustup

    # Language servers
    lua-language-server
    vscode-langservers-extracted # HTML / CSS / JSON
  ];

  home.sessionVariables = {
    EDITOR = "lvim";
    VISUAL = "lvim";
  };

  programs.fish.shellAliases = {
    vim = "lvim";
    vi = "lvim";
  };
}
