{ config, pkgs, ... }:

let 
  imk = import ../packages/imk.nix { inherit pkgs; };
in

{
  environment.systemPackages = with pkgs; [
    unzip
    wget
    tree
    busybox
  ];
}
