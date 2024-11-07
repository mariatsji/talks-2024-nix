export PATH="$coreutils/bin:$gcc/bin"
mkdir -p $out/bin
gcc $src/malbolge.c -o $out/bin/malbolge
