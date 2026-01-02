{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  firefox
  thunderbird
  keepassxc
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
    };
  }];

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];
}