# Fish - Friendly Interactive SHell
{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

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
      # Colored man pages
      {
        name = "colored-man-pages";
        src = pkgs.fishPlugins.colored-man-pages.src;
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
      tree = "eza --tree --icons";

      # Bat
      cat = "bat";

      # Git
      g = "git";
      gst = "git status";
      gco = "git checkout";
      gcb = "git checkout -b";
      gp = "git push";
      gl = "git pull";
      gd = "git diff";
      ga = "git add";
      gc = "git commit";

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
      cd = "z"; # Use zoxide instead of cd

      # Nix
      nixclean = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
      nixgc = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
      nixrs = "sudo nixos-rebuild switch";
    };

    # Fish-specific initialization and functions
    shellInit = ''
      # Disable fish greeting
      set -g fish_greeting ""

      # Use zoxide (smarter cd)
      zoxide init fish | source

      # FZF integration
      set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
      set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
      set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'

      # Bat theme
      set -gx BAT_THEME "Dracula"

      # Custom key bindings
      bind \cf 'fzf | read -l result; and commandline -i $result'

      # Enable vi mode
      fish_vi_key_bindings

      # ASDF configuration code
      if test -z $ASDF_DATA_DIR
          set _asdf_shims "$HOME/.asdf/shims"
      else
          set _asdf_shims "$ASDF_DATA_DIR/shims"
      end

      if not contains $_asdf_shims $PATH
          set -gx --prepend PATH $_asdf_shims
      end
      set --erase _asdf_shims
    '';

    # Custom Fish functions
    functions = {
      # Quick docker container shell access
      dsh = ''
        function dsh --description "Enter shell in docker container"
          docker exec -it $argv[1] /bin/bash 2>/dev/null || docker exec -it $argv[1] /bin/sh
        end
      '';

      # Quick git commit with message
      gcm = ''
        function gcm --description "Git commit with message"
          git commit -m "$argv"
        end
      '';

      # Quick project finder with fzf
      proj = ''
        function proj --description "Find and cd to project directory"
          set -l project_dir (find ~/projects ~/code ~/dev -type d -name .git 2>/dev/null | sed 's/\/.git$//' | fzf)
          if test -n "$project_dir"
            cd $project_dir
          end
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

      # Git log with pretty format
      glog = ''
        function glog --description "Pretty git log"
          git log --oneline --decorate --graph --all
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

      # Cargo watch for Rust
      cw = ''
        function cw --description "Cargo watch shortcut"
          cargo watch -x check -x test -x run
        end
      '';

      # Java class finder
      jfind = ''
        function jfind --description "Find Java class files"
          find . -name "*.java" -o -name "*.class" | grep -i $argv[1]
        end
      '';
    };
  };
}
