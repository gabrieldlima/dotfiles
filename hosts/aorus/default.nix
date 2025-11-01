{
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
    #   wacom.enable = true;
    #
    #   # Enable xorg xinit
    #   displayManager = {
    #     startx.enable = true;
    #   };
    #
    #   # Enable the GNOME desktop environment
    #   # desktopManager = {
    #   #   gnome = {
    #   #     enable = true;
    #   #   };
    #   # };
    #   # displayManager = {
    #   #   gdm = {
    #   #     enable = true;
    #   #   };
    #   # };
    #
    #   # Enable the COSMIC desktop environment
    #   # desktopManager = {
    #   #   cosmic = {
    #   #     enable = true;
    #   #   };
    #   # };
    #   # displayManager = {
    #   #   cosmic-greeter = {
    #   #     enable = true;
    #   #   };
    #   # };
    # };

    udev.extraRules = ''
      KERNEL=="hidraw*", KERNELS=="*054C:0CE6*", MODE="0660", TAG+="uaccess"
      KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ce6", MODE="0660", TAG+="uaccess"
    '';

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    opentabletdriver.enable = true;

    # pulseaudio = {
    #   enable = true;
    #   support32Bit = true;
    # };

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
      extraGroups = [ "wheel" "libvirtd" ];
    };
  };

  environment = {
    # The set of packages that is automatically available to all users
    systemPackages = [
      pkgs.git
      pkgs.vim
    ];
    # Exclude gnome applications
    gnome.excludePackages = with pkgs; [
      baobab
      epiphany
      evince
      file-roller
      geary
      gnome-backgrounds
      gnome-calculator
      gnome-calendar
      gnome-characters
      gnome-clocks
      gnome-connections
      gnome-console
      gnome-contacts
      gnome-disk-utility
      gnome-font-viewer
      gnome-logs
      gnome-maps
      gnome-music
      gnome-software
      gnome-system-monitor
      gnome-text-editor
      gnome-tour
      gnome-user-docs
      gnome-weather
      orca
      seahorse
      simple-scan
      snapshot
      totem
      yelp
    ];
  };

  # Fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      iosevka
      fira-code
      nerd-fonts.fira-code
    ];
  };

  # Virtualisation
  virtualisation.libvirtd.enable = true;

  programs = {
    virt-manager.enable = true;
    nix-ld.enable = true;
  };
}
