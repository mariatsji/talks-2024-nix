let pkgs = import ./pkgs.nix;
    malbolge = import ./malbolge.nix;

in with pkgs; mkShell {
    name = "nix-talk";
    
    packages = [ 
        haskellPackages.patat
        plantuml
        watch
        podman
        qemu
        malbolge
    ];

}