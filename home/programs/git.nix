# Git configuration
{
  config,
  pkgs,
  userInfo,
  ...
}:

{
  home.packages = with pkgs; [
    delta
  ];

  programs.git = {
    enable = true;

    settings = {
      user.name = userInfo.fullName;
      user.email = userInfo.email;
    };

    extraConfig = {
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta.navigate = true;
      merge.conflictStyle = "zdiff3";
    };
  };
}
