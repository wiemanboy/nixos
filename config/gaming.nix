{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    steam
    heroic
    prismlauncher
    gpu-screen-recorder-gtk
    antimicrox
  ];

  programs.steam.enable = true;
}