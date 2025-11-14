# Fish - Friendly Interactive SHell
{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
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
      # Directory jumping
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
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
      gst = "git status";
      gco = "git checkout";
      gcb = "git checkout -b";
      gpush = "git push";
      gpull = "git pull";
      gd = "git diff";
      ga = "git add";
      gc = "git commit";
      gcm = "git commit -m";

      # Docker
      d = "docker";
      dc = "docker-compose";
      dps = "docker ps";
      dpa = "docker ps -a";
      di = "docker images";
      dex = "docker exec -it";

      # Other
      grep = "rg";
      find = "fd";
      du = "dust";

      # Nix
      nixsearch = "nix search nixpkgs";
      nixpkg = "nix shell -p";
      nixclean = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
      nixrs = "sudo nixos-rebuild switch";
    };

    # Custom Fish functions
    functions = {
      # Access Docker container shell
      dsh = ''
        function dsh --description "Enter shell in docker container"
          docker exec -it $argv[1] /bin/bash 2>/dev/null || docker exec -it $argv[1] /bin/sh
        end
      '';

      # Docker cleanup
      dclean = ''
        function dclean --description "Clean up Docker containers and images"
          docker container prune -f
          docker image prune -f
          docker volume prune -f
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
