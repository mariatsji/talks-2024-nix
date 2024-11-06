---
title: Nix
author: Sjur Millidahl
patat:
  # images:
  #  backend: auto
  incrementalLists: true
  wrap: false
  theme:
    codeBlock: [onDullBlack, vividGreen]
    bulletList: [vividGreen]
    orderedList: [vividGreen]
    header: [vividGreen]
    blockQuote: [vividCyan]
  margins:
    top: 1
    bottom: 1
    left: 6
    right: 1
  transition:
    type: slideLeft
    duration: 0.25
mainfont: Monaco
monofont: Monaco
...

# Hello

Nix in 15 min

---

# Pure functions

```txt
+-----+    +-----+           
|     |    |     |           
|  a  +--->|     |           
|     |    |     |    +-----+
+-----+    |     |    |     |
           |  f  +--->| out |
+-----+    |     |    |     |
|     |    |     |    +-----+
|  b  +--->|     |           
|     |    |     |           
+-----+    +-----+           
```

---

# Properties of pure functions

* Reproducible
* Input => Output
* No side effects
* No randomness
* Easy to test
* Eeasy to reason about
* Can be composed

---

# Builds as a pure function

The core nix idea:

```txt
+-----+    +-----+           
|     |    |     |           
| src +--->|     |           
|     |    |     |    +-----+
+-----+    |     |    |     |
           | nix +--->| out |
+-----+    |     |    |     |
|     |    |     |    +-----+
| gcc +--->|     |           
|     |    |     |           
+-----+    +-----+           
```

Reproducible!

---

# But whaaat is Nix

- Declerative language
- (A linux distro)
- Mind-virus

---

# Example-time

Malbolge

* Ben Olmstead
* 1998
* Almost impossible to use
* 2000 (first program)
* By a beam search (lisp)

---

malbolge.c
```txt
//c-code obfuscated for audience safety
```

malbolge.nix
```nix
let pkgs = (import (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz";
    }) {});

in with pkgs; stdenv.mkDerivation {
  name = "malbolge";
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];
  inherit coreutils clang;
  src = ./.;
  system = builtins.currentSystem;
}
```

builder.sh
```bash
export PATH="$coreutils/bin:$clang/bin"
mkdir -p $out/bin
clang -o $out/bin/malbolge $src/malbolge.c
```

---

# Demo I

Build malbolge.nix

---

# Example - build docker img with nix

```nix
with (import ./pkgs.nix); dockerTools.buildImage {
  name = "hello-world";
  copyToRoot = buildEnv {
    name = "image-root";
    pathsToLink = ["/"];
    paths = [
      (import ./malbolge.nix)
      ./src
      coreutils
      busybox
      bash ];
  };

  config = {
    Cmd = [ "/bin/malbolge" "/hello.malbolge" ];
  };
}
```

---

# Demo II

Build docker.nix

---

Thank you for your attention
