export PATH="$coreutils/bin:$clang/bin"
mkdir -p $out/bin
clang $src/malbolge.c -o $out/bin/malbolge
