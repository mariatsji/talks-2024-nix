let pkgs = import ./pkgs.nix { system = builtins.currentSystem; };
    
in with pkgs; stdenv.mkDerivation {
  name = "malbolge";
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];
  inherit clang coreutils;
  src = ./.;
  system = builtins.currentSystem;
}
