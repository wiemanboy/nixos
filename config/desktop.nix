{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode
    firefox
    chromium
    thunderbird
    keepassxc
    onedrive
    nextcloud-client
    openrgb
    discord
    betterdiscordctl
    spotify
    gimp
    btop
    usbimager
    whatsapp-electron
    wl-clipboard
    gnomeExtensions.desktop-clock
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.system-monitor
    gnomeExtensions.clipboard-history
  ];

  services.flatpak.enable = true; 

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
        use-system-font = false;
        custom-font = "Hurmit Nerd Font 12";
      };

      "org/gnome/desktop/interface" = {
        accent-color = "purple";
        color-scheme = "prefer-dark";
        cursor-theme = "Bibata-Modern-Ice";
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = ":minimize,maximize,close";
      };
    };
  }];

  fonts.packages = with pkgs; [
    nerd-fonts.hurmit
  ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}