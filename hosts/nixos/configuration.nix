{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  networking = {
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
    firewall.enable = false;
  };

  services.resolved = {
    enable = true;
  };

  time.timeZone = "Asia/Shanghai";

  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  # pipewire
  hardware.pulseaudio.enable = false;
  hardware.opengl.enable = true;
  # sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Command tool
    git
    gcc
    vim
    wget
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  system.stateVersion = "24.11";

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      font-awesome
      nerd-fonts.jetbrains-mono
    ];
    fontconfig = {
      localConf = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
        <fontconfig>
          <match target="font">
            <edit mode="assign" name="antialias">
              <bool>true</bool>
            </edit>
          </match>

          <match>
            <test compare="contains" name="lang">
              <string>zh_CN</string>
            </test>
            <edit mode="prepend" name="family">
              <string>Noto Sans CJK SC</string>
            </edit>
          </match>

           <match target="pattern">
              <test qual="any" name="family">
                <string>sans-serif</string></test>
              <edit name="family" mode="prepend" binding="same">
                <string>Noto Sans CJK SC</string>
              </edit>
          </match>

          <match target="pattern">
            <test qual="any" name="family">
              <string>serif</string>
            </test>
            <edit name="family" mode="prepend" binding="same">
              <string>Noto Serif</string>
            </edit>
          </match>
        </fontconfig>
      '';
    };
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-rime
      rime-data
    ];
  };

  virtualisation.docker = {
    enable = true;
    daemon = {
      settings = {
        proxies = {
          http-proxy = "http://127.0.0.1:7890";
          https-proxy = "http://127.0.0.1:7890";
        };
      };
    };
  };
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.elliot = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager" "docker"];
    };
  };
}
