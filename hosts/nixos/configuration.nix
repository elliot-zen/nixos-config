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
    extraHosts = ''
      192.168.49.2 core.harbor.domain
    '';
  };
  services.resolved = {
    enable = true;
  };
  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      PasswordAuthentication = true;
      PubkeyAuthentication = true;
      PermitRootLogin = "prohibit-password";
    };
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
  services.pulseaudio.enable = false;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
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
    man-pages
    man-pages-posix
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
      wqy_microhei
      nerd-fonts.jetbrains-mono
    ];
    fontconfig = {
      defaultFonts = {
        serif = [
          "WenQuanYi Micro Hei"
        ];
        sansSerif = [
          "WenQuanYi Micro Hei"
        ];
        monospace = [
          "WenQuanYi Micro Hei"
          "JetBrainsMono Nerd Font"
        ];
      };
      localConf = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
        <fontconfig>
          <match target="pattern">
            <test name="family" compare="contains">
              <string>Arial</string>
            </test>
            <edit name="family" binding="strong">
              <string>WenQuanYi Micro Hei</string>
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

  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = false;
      daemon = {
        settings = {
          # proxies = {
          #   http-proxy = "http://127.0.0.1:7890";
          #   https-proxy = "http://127.0.0.1:7890";
          # };
          insecure-registries = ["core.harbor.domain"];
          registry-mirrors = ["https://docker.1ms.run"];
        };
      };
    };
    virtualbox = {
      host.enable = true;
    };
  };

  programs.zsh.enable = true;
  users = {
    extraGroups = {
      vboxusers = {
        members = ["user-with-access-to-virtualbox"];
      };
    };
    defaultUserShell = pkgs.zsh;
    users.elliot = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager" "docker"];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJTNZmrKbe9OCXe63l36BDxxI9aGwlhHxLrRwLaGTKWU elliotzen256@gmail.com"
      ];
    };
  };
}
