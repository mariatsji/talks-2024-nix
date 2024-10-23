---
title: Nix
author: Sjur Millidahl
patat:
  # images:
  #  backend: auto
  eval:
    plantuml:
        command: plantuml -tutxt -p
        fragment: true # optional
        replace: true # optional
        container: code # optional
  wrap: false
  margins:
    top: 2
    bottom: 2
    left: 8
    right: 4
    theme:
        emph: [vividBlue, onVividBlack, italic]
        strong: [bold]
        imageTarget: [onDullWhite, vividRed]
mainfont: Monaco
monofont: Monaco
...

# Nix

- Declerative language
- Mind-magnet
- (A linux distro)

---

# The core idea

Building software can be a pure function

```plantuml
@startuml
main.c --> mkDerivation
gcc --> mkDerivation
@enduml
```