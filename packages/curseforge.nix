{ pkgs }:

let
  pname = "curseforge";
  version = "latest";

  src = pkgs.fetchurl {
    url = "https://curseforge.overwolf.com/downloads/curseforge-${version}-linux.AppImage";
    hash = "sha256-9qGsqRRGpzw0Xfygt0lzafWdd9hwuKhR1hW/yn8JXNY=";
  };

  desktopEntry = pkgs.makeDesktopItem {
    name = pname;
    desktopName = pname;
    exec = pname;
  };
in

pkgs.appimageTools.wrapType2 {
  inherit pname version src;
  extraBwrapArgs = [ "--dir" "/etc/nixos" ];

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    cp ${desktopEntry}/share/applications/${pname}.desktop $out/share/applications/${pname}.desktop
  '';
}
