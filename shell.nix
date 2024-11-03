let pkgs = import ./pkgs.nix;
    patat = pkgs.haskellPackages.patat;

in with pkgs; mkShell {
    name = "nix-talk";
    packages = [ 
        patat
        plantuml
        watch # dev
        podman
        qemu
    ];
}