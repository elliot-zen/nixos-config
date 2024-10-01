{pkgs, lib,...}:{
  imports = [
    ./zsh
    ./gitui
    ./neovim
    ./tmux
    ./k9s
  ];
  programs.fzf = {
    enable = true;
  };
  programs.fastfetch = {
    enable = true;
  };
  programs.jq = {
    enable = true;
  };
  programs.bat = {
    enable = true;
  };
  programs.ripgrep = {
    enable = true;
  };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true; 
    nix-direnv.enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    icons = true;
    enableZshIntegration = true;
  };
}

