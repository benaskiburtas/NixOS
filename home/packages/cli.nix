# CLI utility packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat # Better 'cat' in Rust, command: bat
    dua # Interactive disk analyzer, command: dua
    dust # More intuitive du, command: dust
    eza # Modern ls replacement, command: eza
    fastfetch # System info display, command: fastfetch
    fd # Like 'find' but in Rust, command: fd
    file # File type identification, command: file
    fzf # Fuzzy finder, command: fzf
    gitui # Git UI in terminal, command: gitui
    glow # Terminal markdown viewer, command: glow
    jq # JSON processor, command: jq
    nix-output-monitor # Nix output parser, command: nom
    nixfmt-tree # Nix code formatter, command: nixfmt
    presenterm # Terminal slideshow tool, command: presenterm
    ripgrep # Fast grep alternative, command: rg
    ripgrep-all # Like 'rg' but also does books, Office documents and etc. command: rga
    tree # Directory tree viewer, command: tree
    which # Locate command binaries, command: which
    yq-go # YAML processor (Go version), command: yq
    zoxide # Smarter 'cd' command, in Rust, command: z
  ];
}
