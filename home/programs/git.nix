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
      core.pager = "delta";
      delta.navigate = true;
      interactive.diffFilter = "delta --color-only";
      merge.conflictStyle = "zdiff3";
      user.email = userInfo.email;
      user.name = userInfo.fullName;
    };
  };
}
