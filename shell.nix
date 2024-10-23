with (import ./pkgs.nix); mkShell {
    name = "nix-talk";
    packages = [ 
        haskellPackages.patat
        plantuml
    ];
}