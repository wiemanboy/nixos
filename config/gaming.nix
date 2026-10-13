{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    steam
    heroic
    prismlauncher
    gdlauncher-carbon
    gpu-screen-recorder-gtk
    antimicrox
  ];

  programs.steam.enable = true;
}