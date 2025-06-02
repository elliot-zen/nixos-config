{ pkgs,outputs, ...}: {
  programs.bat.enable = true;
  home = {
    stateVersion = "24.11";
    username = "elliot";
    homeDirectory = "/Users/elliot";
    packages = with pkgs; [
      uv
      kubernetes-helm
      delta
      graphviz
      gnupg
    ];
    sessionPath = [
      "$HOME/development/flutter/bin"
      "$HOME/.rvm/bin"
    ];
  };
  myHomeManager = {
    bundles.general.enable = true;
    alacritty.enable = true;
  };
  programs.zsh.envExtra = ''
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  '';

}
