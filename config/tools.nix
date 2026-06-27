{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    unzip
    wget
    tree
    busybox
  ];
}
