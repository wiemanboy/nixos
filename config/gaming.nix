{ config, pkgs, ... }:

let
   curseforge = import ../packages/curseforge.nix { inherit pkgs; };
in

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