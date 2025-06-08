# Main system configuration
{ config, pkgs, ... }:

{
  # -----------------------------------------------------------
  # System
  # -----------------------------------------------------------
  system.stateVersion = "24.11";
  networking.networkmanager.enable = true; # Network management daemon
  virtualisation.docker.enable = true; # Enable Docker daemon

  # -----------------------------------------------------------
  # Boot Configuration
  # -----------------------------------------------------------
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true; # EFI system support
  };

  # -----------------------------------------------------------
  # Localization
  # -----------------------------------------------------------
  time.timeZone = "Europe/Vilnius"; # System timezone
  i18n.defaultLocale = "en_US.UTF-8"; # System-wide locale

  # -----------------------------------------------------------
  # Desktop Environment
  # -----------------------------------------------------------
  services = {
    displayManager.sddm.enable = true; # SDDM display manager
    desktopManager.plasma6.enable = true; # KDE Plasma 6 desktop

    blueman.enable = true; # Bluetooth pairing GUI
  };

  # -----------------------------------------------------------
  # Multimedia & Sound
  # -----------------------------------------------------------
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    extraConfig.pipewire."custom-adjustments" = {
      "context.properties" = {
        "link.max-buffers" = 64;
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 1024;
        "default.clock.min-quantum" = 1024;
        "default.clock.max-quantum" = 2048;
      };
    };
  };

  services.xserver = {
    xkb.layout = "us,lt";
    xkb.options = "grp:win_space_toggle";
  };

  # -----------------------------------------------------------
  # Nix Settings & Package Management
  # -----------------------------------------------------------
  nixpkgs.config.allowUnfree = true; # Allow proprietary packages

  nix = {
    settings.experimental-features = [
      # Enable new Nix features
      "nix-command"
      "flakes"
    ];
  };

  environment = {
    # Core system utilities
    systemPackages = with pkgs; [
      git # Version control
      vim # Text editor
      wget # File downloader
      gparted # Disk management (GUI)
    ];

    # Default text editor
    variables.EDITOR = "vim";
  };

  # Default system shell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # -----------------------------------------------------------
  # Gaming Configuration
  # -----------------------------------------------------------
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Remote play ports
      dedicatedServer.openFirewall = true; # Dedicated server ports
      localNetworkGameTransfers.openFirewall = true; # Local transfers
      gamescopeSession.enable = true; # Use gamescope compositor for Steam game session
    };
    gamemode.enable = true; # Game performance boost daemon
  };

  # -----------------------------------------------------------
  # Security
  # -----------------------------------------------------------
  security.polkit.enable = true; # Enable polkit
  security.rtkit.enable = true; # Realtime kit for pipewire
}
