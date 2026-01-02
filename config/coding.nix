{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      push = { autoSetupRemote = true; };
      user = {
        name  = "wiemanboy";
        email = "wiemanboy@gmail.com";
      };
      alias = { 
        st = "status"; 
        sw = "switch"; 
        br = "branch"; 
        c = "commit"; 
        cm = "commit -m";
        cma = "commit -a -m";
        ca = "commit --amend";
        pl = "pull";
        plr = "pull --rebase";
        ps = "ps";
        yeet = "'!git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'";
        pop = "stash pop";
      }; 
    };
  };
  
  environment.systemPackages = with pkgs; [
    vscode
    git
    yq-go
    jq
    kubectl
    kubernetes-helm
    talosctl
    docker
  ];
}