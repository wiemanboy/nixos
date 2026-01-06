{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode
    firefox
    thunderbird
    keepassxc
    onedrive
    openrgb
    discord
    betterdiscordctl
    spotify
    gimp
    btop
    usbimager
  ];

  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  programs.dconf.profiles.user.databases = [{
    settings = {
      "org/gnome/settings-daemon/plugins/media-keys" = { 
        custom-keybindings = [ 
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" 
          ]; 
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = { 
        binding = "<Control><Alt>t"; 
        command = "kgx"; 
        name = "Open console"; 
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = { 
        binding = "<Super>e"; 
        command = "nautilus"; 
        name = "Open files"; 
      };

      "org/gnome/Console" = {
        custom-font = "0xProto Nerd Font 10";
      };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = ":minimize,maximize,close";
      };
    };
  }];

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];
}