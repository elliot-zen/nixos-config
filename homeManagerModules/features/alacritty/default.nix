{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        import = [./catppuccin-macchiato.toml];
      };
      window = {
        option_as_alt = "Both";
      };
      env = {
        term = "xterm-256color";
      };
      terminal = {
        shell = {
          program = "${pkgs.zsh}/bin/zsh";
          args = ["-l"];
        };
      };

      font = {
        size = 15.0;
        normal = {
          family = "JetbrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetbrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetbrainsMono Nerd Font";
          style = "Italic";
        };
      };
    };
  };
}
