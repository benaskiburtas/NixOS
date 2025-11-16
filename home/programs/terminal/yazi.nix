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
          {
            run = "nvim \"$@\"";
            block = true;
          }
        ];
        text = [
          {
            run = "nvim \"$@\"";
            block = true;
          }
        ];
      };
    };
  };
}
