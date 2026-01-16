{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    gh
    yq-go
    jq
    kubectl
    kubectx
    kubernetes-helm
    talosctl
    opentofu
  ];

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  users.users.wiebol = {
    isNormalUser = true;
    extraGroups = [ "docker" ];
  };

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
        ps = "push";
        yeet = "!git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)";
        pop = "stash pop";
      }; 
    };
  };
}
