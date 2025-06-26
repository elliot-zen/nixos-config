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
      mihomo-party
      localsend
      vscode-fhs
      dbeaver-bin
      obsidian
      typora
      obs-studio
      vlc

      minikube
      kubernetes-helm
      kubectl
      telepresence2
      k9s
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
