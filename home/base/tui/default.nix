{...}:{
  imports = [
    ./gitui
    ./k9s
    ./tmux
  ];
  programs.git = {
    enable = true;
    userName = "elliot"; 
    userEmail = "elliotzen256@gmail.com"; 
  };
}
