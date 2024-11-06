with (import ./pkgs.nix); dockerTools.buildImage {
  name = "hello-world";
  copyToRoot = buildEnv {
    name = "image-root";
    pathsToLink = ["/"];
    paths = [
      (import ./malbolge.nix)
      ./src
      coreutils
      busybox
      bash ];
  };

  config = {
    Cmd = [ "/bin/malbolge" "/hello.malbolge" ];
  };
}