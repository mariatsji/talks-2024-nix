export PATH="$coreutils/bin:$clang/bin"
mkdir -p $out/bin
clang -o $out/bin/malbolge $src/malbolge.c
