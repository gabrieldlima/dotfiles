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
      extra-substituters = [ "https://yazi.cachix.org" ];
      extra-trusted-public-keys = [ "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k=" ];
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


  services = {
    # Enable the X11 windowing system
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      displayManager = {
        startx.enable = true;
      };
      wacom.enable = true;
    };

    # Enable the COSMIC desktop environment
    # desktopManager = {
    #   cosmic = {
    #     enable = true;
    #   };
    # };
    # displayManager = {
    #   cosmic-greeter = {
    #     enable = true;
    #   };
    # };

    hardware.openrgb = {
      enable = true;
      motherboard = "amd";
    };
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    opentabletdriver.enable = false;
    pulseaudio.enable = false;
    bluetooth = {
      enable = false;
      powerOnBoot = true;
    };
  };

  # Additional user accounts to be created automatically by the system
  users.users = {
    gabriel = {
      description = "Gabriel Lima";
      isNormalUser = true;
      initialPassword = "qw12QW!@";
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

  programs = {
    virt-manager.enable = true;
    nix-ld.enable = true;
    gamemode = {
      enable = true;
      settings.general.inhibit_screensaver = 0;
    };
  };

  # NixOS release
  system.stateVersion = "24.05";
}
