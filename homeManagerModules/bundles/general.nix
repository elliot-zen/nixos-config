{config, lib, pkgs, ...}: {
  myHomeManager = {
    zsh.enable = lib.mkDefault true;
    tmux.enable = lib.mkDefault true;
    starship.enable = lib.mkDefault true;
    yazi.enable = lib.mkDefault true;
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs;[
    bat
    fzf

    tree-sitter
    nodejs
    typescript
    typescript-language-server
    nixd
    alejandra
    lua-language-server
  ];

  programs.git = {
    enable = true;
    userName = "elliot";
    userEmail = "elliotzen256@gmail.com";
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    icons = true;
  };
}
