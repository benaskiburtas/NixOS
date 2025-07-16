# Yazi - terminal-based file manager
{ pkgs, ... }: 

{
  programs.yazi = {
    enable = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_by = "modified";
        sort_reverse = true;
      };
      opener = {
        edit = [
          { run = "lvim \"$@\""; block = true; }
        ];
        text = [
          { run = "lvim \"$@\""; block = true; }
        ];
      };
    };
  };
}