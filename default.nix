let pkgs = (import ./pkgs.nix) { };
    linuxPkgs = (import ./pkgs.nix) { system = "x86_64-linux"; };
    malbolge = import ./malbolge.nix;
in malbolge