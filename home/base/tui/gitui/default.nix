{...}:{
  programs.gitui = {
    enable = true;
    keyConfig = ''
      (
        move_left: Some(( code: Char('h'), modifiers: "")),
        move_right: Some(( code: Char('l'), modifiers: "")),
        move_up: Some(( code: Char('k'), modifiers: "")),
        move_down: Some(( code: Char('j'), modifiers: "")),

        stash_open: Some(( code: Char('l'), modifiers: "")),
        open_help: Some(( code: F(1), modifiers: "")),

        status_reset_item: Some(( code: Char('U'), modifiers: "SHIFT")),
      )
    '';
    theme = ''
      (
          command_fg: Some("#4c4f69"),
          selection_bg: Some("#acb0be"),
          selection_fg: Some("#4c4f69"),
          cmdbar_bg: Some("#e6e9ef"),
          cmdbar_extra_lines_bg: Some("#e6e9ef"),
          disabled_fg: Some("#8c8fa1"),
          diff_line_add: Some("#40a02b"),
          diff_line_delete: Some("#d20f39"),
          diff_file_added: Some("#40a02b"),
          diff_file_removed: Some("#e64553"),
          diff_file_moved: Some("#8839ef"),
          diff_file_modified: Some("#fe640b"),
          commit_hash: Some("#7287fd"),
          commit_time: Some("#5c5f77"),
          commit_author: Some("#209fb5"),
          danger_fg: Some("#d20f39"),
          push_gauge_bg: Some("#1e66f5"),
          push_gauge_fg: Some("#eff1f5"),
          tag_fg: Some("#dc8a78"),
          branch_fg: Some("#179299")
      )
    '';
  };

}
