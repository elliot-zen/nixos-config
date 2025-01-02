{
  config,
  lib,
  pkgs,
  ...
}: {
  myHomeManager = {
    zsh.enable = lib.mkDefault true;
    tmux.enable = lib.mkDefault true;
    yazi.enable = lib.mkDefault true;
    direnv.enable = lib.mkDefault true;
    gitui.enable = lib.mkDefault true;
    starship.enable = lib.mkDefault true;
    k9s.enable = lib.mkDefault true;
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    bat

    tree-sitter
    nodejs
    typescript
    typescript-language-server
    nixd
    alejandra
    lua-language-server
    rust-analyzer
  ];

  programs.git = {
    enable = true;
    userName = "elliot";
    userEmail = "elliotzen256@gmail.com";
    extraConfig = {
      core = {
        autocrlf = "input";
        editor = "nvim";
      };
      merge = {
        conflictstyle = "zdiff3";
      };
    };
    delta = {
      enable = true;
      options = {
        navigate = true;
        dark = true;
        line-numbers = true;
        # side-by-side = true;
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    icons = "auto";
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
