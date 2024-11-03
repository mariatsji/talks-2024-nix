{ system ? builtins.currentSystem }:

let pkgs = (import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz";
    }) { inherit system; });

in pkgs