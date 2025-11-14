# CLI utility packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    dua
    dust
    eza
    fastfetch
    fd
    file
    fzf
    gitui
    glow
    jq
    nix-output-monitor
    nixfmt-tree
    presenterm
    ripgrep
    ripgrep-all
    tree
    which
    yq-go
    zoxide
  ];
}
