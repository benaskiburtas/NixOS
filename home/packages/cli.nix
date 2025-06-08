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
    just # Run project-specific commands, command: just
    kondo # Clean dependencies & build for various build tools, command: kondo
    mask # Task runner, defined via markdown, command: mask
    mprocs # Run commands in parallel, command: mprocs
    nix-output-monitor # Nix output parser, command: nom
    nixfmt-rfc-style # Nix code formatter, command: nixfmt
    pkg-config # Wrapper script for package information, command: pkg-config
    presenterm # Terminal slideshow tool, command: presenterm
    ripgrep # Fast grep alternative, command: rg
    ripgrep-all # Like 'rg' but also does books, Office documents and etc. command: rga
    tree # Directory tree viewer, command: tree
    uutils-coreutils # GNU Core Utilities, rewritten in Rust, commands: cp, chmod, date, echo, etc.
    which # Locate command binaries, command: which
    yazi # File manager, command: yazi
    yq-go # YAML processor (Go version), command: yq
    zellij # Terminal workspace, command: zellij
    zoxide # Smarter 'cd' command, in Rust, command: z
  ];
}
