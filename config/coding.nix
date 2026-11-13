{ config, pkgs, ... }:

let 
  mount-on-pod = import ../packages/mount-on-pod.nix { inherit pkgs; };
in

{
  environment.systemPackages = with pkgs; [
    git
    gh
    git-credential-oauth

    yq-go
    jq

    kubectl
    kubectx
    kubelogin-oidc
    kubernetes-helm
    mount-on-pod
    talosctl
    
    opentofu
    go
    gopls
    gcc
    kcl
    kcl-language-server

    neovim
    vimPlugins.nvchad-ui
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
      credential.helper = [
        "cache --timeout 7200"
        "oauth"
      ];
      "credential \"https://forgejo.wieman.cloud\"" = {
        oauthClientId = "a4792ccc-144e-407e-86c9-5e7d8d9c3269";
        oauthAuthURL = "/login/oauth/authorize";
        oauthTokenURL = "/login/oauth/access_token";
      };
    };
  };

  programs.bash = {
    completion.enable = true;
    interactiveShellInit = ''
      export kubeconfig="$HOME/.kube/config"

      source <(kubectl completion bash)
      alias k="kubectl"
      complete -o default -F __start_kubectl k

      # Completion is still kind of broken
      alias kctx="kubectx"
      complete -o default -F __start_kubectx kctx

      alias kns="kubens"
      complete -o default -F __start_kubens kns
    '';
  };
}
