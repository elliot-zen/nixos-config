{pkgs, ...}:{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    clock24 = true;
    mouse = true;
    terminal = "screen-256color";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = "set -g @catppuccin_flavor 'mocha'";
      }
    ];
    extraConfig = ''
      set -g mouse on 

      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5
    '';
  };
}
