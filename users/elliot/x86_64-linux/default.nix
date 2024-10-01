{pkgs, ...}:
{
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.elliot = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ]; 
    };
  };
}
