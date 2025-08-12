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