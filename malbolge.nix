let pkgs = import ./pkgs.nix;
    
in with pkgs; stdenv.mkDerivation {
  name = "malbolge";
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];
  inherit clang coreutils;
  src = ./.;
  system = builtins.currentSystem;
}
