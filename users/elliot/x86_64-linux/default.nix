{pkgs, ...}:
{
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.elliot = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "docker"]; 
    };
  };

  virtualisation.docker.enable = true;
  systemd.services.docker.environment = {
    HTTP_PROXY = "http://127.0.0.1:20171";
    HTTPS_PROXY = "http://127.0.0.1:20171";
    NO_PROXY = "::1, localhost, 127.0.0.0/8";
  };

  environment.sessionVariables = rec {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
  };
}
