{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.firewall.enable = false;

  time.timeZone = "Asia/Shanghai";

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  # pipewire
  hardware.pulseaudio.enable = false;
  # sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.elliot = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ]; 
    };
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Command tool
    git
    vim 
    wget
    ripgrep
    unzip

    # Daily tool
    firefox
    google-chrome
    v2raya
    xdg-desktop-portal-hyprland
    nwg-look

    # Hyprland
    hyprland
    rofi-wayland
    waybar
    dunst
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  system.stateVersion = "24.05"; 

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-rime
      rime-data
    ];
  };
}

