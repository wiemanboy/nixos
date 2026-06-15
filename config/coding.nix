{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    gh
    yq-go
    jq
    kubectl
    kubectx
    kubelogin-oidc
    kubernetes-helm
    talosctl
    opentofu
    go
    gopls
    gcc
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
      push = { autoSetupRemote = true; };
      fetch = { 
        prune = true; 
        pruneTags = true;
        all = true;
      };
      diff = {
        algorithm = "histogram";
      };
      branch = {
        sort = "committerdate";
      };
      tag = {
        sort = "version:refname";
      };
      column = {
        ui = "auto";
      };
    };
  };
}
