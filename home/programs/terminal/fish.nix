# Fish - Friendly Interactive SHell
{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      zoxide init fish | source
    '';

    plugins = [
      # FZF integration for fuzzy finding
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      # Auto-pair brackets, quotes, etc.
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      # Done notification when long commands finish
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
    ];

    shellAliases = {
      # Eza
      ls = "eza --icons";
      ll = "eza -l --icons";
      la = "eza -la --icons";

      # Bat
      cat = "bat";

      # Git
      g = "git";
      ga = "git add";
      gc = "git commit";
      gcb = "git checkout -b";
      gcm = "git commit -m";
      gco = "git checkout";
      gd = "git diff";
      gpull = "git pull";
      gpush = "git push";
      gst = "git status";

      # Docker
      d = "docker";
      dc = "docker-compose";
      dex = "docker exec -it";
      di = "docker images";
      dpa = "docker ps -a";
      dps = "docker ps";

      # Other
      cd = "z";
      du = "dust";
      find = "fd";
      grep = "rg";

      # Nix
      nixclean = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
      nixpkg = "nix shell -p";
      nixrs = "sudo nixos-rebuild switch";
      nixsearch = "nix search nixpkgs";
    };

    # Custom Fish functions
    functions = {
      # Docker cleanup
      dclean = ''
        function dclean --description "Clean up Docker containers and images"
          docker container prune -f
          docker image prune -f
          docker volume prune -f
        end
      '';

      # Access Docker container shell
      dsh = ''
        function dsh --description "Enter shell in docker container"
          docker exec -it $argv[1] /bin/bash 2>/dev/null || docker exec -it $argv[1] /bin/sh
        end
      '';

      # Quick file search and edit
      fe = ''
        function fe --description "Find file and edit with $EDITOR"
          set -l file (fd --type f | fzf)
          if test -n "$file"
            $EDITOR $file
          end
        end
      '';
    };
  };
}
