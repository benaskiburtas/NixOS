# Open Broadcast Software Studio
{ pkgs, ... }:

{
  # Install base package
  home.packages = with pkgs; [
    obs-studio
  ];

  # Auto-start service (on login)
  systemd.user.services.obs-studio = {
    Unit = {
      Description = "OBS Studio";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.obs-studio}/bin/obs --minimize-to-tray --startreplaybuffer";
      Restart = "on-failure";
      RestartSec = 5;
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
