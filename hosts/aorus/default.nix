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
    # xserver = {
    #   enable = true;
    #   videoDrivers = [ "amdgpu" ];
    #   displayManager = {
    #     startx.enable = true;
    #   };
    #   wacom.enable = true;
    # };

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
    opentabletdriver.enable = true;
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

}
