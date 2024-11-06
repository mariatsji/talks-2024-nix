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
    top: 2
    bottom: 2
    left: 8
    right: 4
  transition:
    type: slideLeft
    duration: 0.25
mainfont: Monaco
monofont: Monaco
...

# Nix

- Declerative language
- (A linux distro)
- Mind-virus

---

# The core idea

Building software can be a pure function

Brings reproducibility

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

# On pure functions

* Reproducible
* Input => Output
* No side effects
* No randomness
* Easy to test
* Eeasy to reason about
* Can be composed

---

# Builds as a pure function

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

---

# Example-time

Malbolge

* Ben Olmstead
* 1998
* Almost impossible to use
* 2000 (first program)
* By a beam search (lisp)

---

default.nix
```nix
let tag = "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz";
    pkgs = (import (builtins.fetchTarball {
      url = tag;
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
mkdir $out
clang -o $out/malbolge $src/malbolge.c
```

malbolge.c
```c
(...)
const char xlat1[] =
  "+b(29e*j1VMEKLyC})8&m#~W>qxdRp0wkrUo[D7,XTcA\"lI"
  ".v%{gJh4G\\-=O@5`_3i<?Z';FNQuY]szf$!BS/|t:Pn6^Ha";
(...)
```

---

# Demo

Build it

---

# Build a docker image

TODO put malbolge hello world in docker
