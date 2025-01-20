{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      (final: prev: {
        mihomo-party = prev.mihomo-party.overrideAttrs (f: p:
          with pkgs; {
            version = "1.6.0";
            src = fetchurl {
              url = "https://github.com/mihomo-party-org/mihomo-party/releases/download/v${f.version}/mihomo-party-linux-${f.version}-amd64.deb";
              hash = "sha256-dcjw4qGs6Q04LzY2cQLB8DrLybXFH8qFGZfLGz2aBM0=";
            };
          });
      })
    ];
  };

  home = {
    stateVersion = "24.11";
    username = "elliot";
    homeDirectory = "/home/elliot";
    packages = with pkgs; [
      mihomo-party
    ];
  };
  myHomeManager = {
    bundles.general.enable = true;
    bundles.desktop.enable = true;
  };

  programs.bat.enable = true;

  programs.zsh.profileExtra = ''
    [ -z $TMUX ] || return
    if uwsm check may-start && uwsm select; then
    	exec systemd-cat -t uwsm_start uwsm start default
    fi
  '';
}
