{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # Nix settings
  nix = {
    # Store optimization
    optimise = {
      automatic = true;
      dates = [ "13:00" ];
    };

    # Garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;

      # substituters = ["https://hyprland.cachix.org"];
      # trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  };

  # nixpkgs instance config
  nixpkgs = {
    config = {
      # Always allow unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;

  # The time zone used when displaying times and dates
  time.timeZone = "America/Sao_Paulo";

  # Networking settings
  networking = {
    hostName = "aorus";
    networkmanager = {
      enable = true;
    };
  };

  # Enable the X11 windowing system
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    displayManager = {
      startx.enable = true;
    };
    wacom.enable = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  hardware.opentabletdriver.enable = false;

  # Enable the Pulseaudio sound server
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Additional user accounts to be created automatically by the system
  users.users = {
    gabriel = {
      description = "Gabriel Lima";
      isNormalUser = true;
      extraGroups = [ "wheel" "libvirtd" "gamemode" ];
    };
  };

  # The set of packages that is automatically available to all users
  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  # Fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };

  # Virtualisation
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # OpenRGB
  services.hardware.openrgb = {
    enable = true;
    motherboard = "intel";
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Gamemode
  programs.gamemode.enable = true;
  programs.gamemode.settings.general.inhibit_screensaver = 0;

  programs.nix-ld.enable = true;

  # NixOS release
  system.stateVersion = "23.11";
}
