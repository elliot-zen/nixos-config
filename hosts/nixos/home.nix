{
  pkgs,
  ...
}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    stateVersion = "24.11";
    username = "elliot";
    homeDirectory = "/home/elliot";
    packages = with pkgs; [
      code-cursor
      mihomo-party
      minikube
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

  programs.zathura = {
    enable = true;
    extraConfig = ''
      set selection-clipboard clipboard
    '';
  };
}
