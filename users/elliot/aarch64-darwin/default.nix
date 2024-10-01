{config, pkgs, ...}:{
  programs.zsh.enable = true;
  users.users.elliot = {
    name = "elliot";
    home = "/Users/elliot";
    shell = pkgs.zsh;
  };
}

