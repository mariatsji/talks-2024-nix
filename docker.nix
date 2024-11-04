let pkgs = import ./pkgs.nix;
    malbolge = import ./malbolge/default.nix;
    # malbolge src code
    hello.malbolge = ''
      (=<`#9]~6ZY327Uv4-QsqpMn&+Ij"'E%e{Ab~w=_:]Kw%o44Uqp0/Q?xNvL:`H%c#DD2^WV>gY;dts76qKJImZkj
    '';

in pkgs.dockerTools.buildImage {
  name = "hello-world";

  copyToRoot = [ ./malbolge ];
  config = {
    Cmd = [ "${malbolge}/bin/malbolge <(echo ${hello.malbolge})" ];
  };
}