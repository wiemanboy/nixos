{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "mount-on-pod";

  src = ./mount-on-pod.sh;

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/mount-on-pod
    chmod +x $out/bin/mount-on-pod
  '';
}