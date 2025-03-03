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

    udev.extraRules = ''
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

  # The set of packages that is automatically available to all users
  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  # Fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      jetbrains-mono
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
