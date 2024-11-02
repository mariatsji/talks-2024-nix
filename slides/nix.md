---
title: Nix
author: Sjur Millidahl
patat:
  # images:
  #  backend: auto
  incrementalLists: true
  eval:
    plantuml:
        command: plantuml -ttxt -p
        fragment: false # optional
        replace: true # optional
        container: code # optional
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

```plantuml
@startuml
Input : a
Output : b
Function : f

Input -> Function
Function -> Output
@enduml
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

```plantuml
@startuml

Source : hello.c
Tool : gcc
nix : mkDerivation

Source -> nix
Tool -> nix

Derivation : bin/hello
nix -> Derivation

@enduml
```
