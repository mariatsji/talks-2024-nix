let pkgs = import ./pkgs.nix;
    malbolge = import ./malbolge/default.nix;

in pkgs.dockerTools.buildImage {
  name = "hello-world";

  copyToRoot = [ ./malbolge ];
  config = {
    Cmd = [ "${malbolge}/bin/malbolge /hello.malbolge" ];
  };
}