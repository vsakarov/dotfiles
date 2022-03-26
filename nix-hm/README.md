# Nix and Home manager based configuration

# Home manager installation instructions
https://nix-community.github.io/home-manager/index.html#ch-installation

# Configuration
Create $(hostname).nix file in the current directory and link it from ~/.config/nixpkgs/home.nix
```nix
{ config, pkgs, ... }:
let
  user = "XXX";
  email = "XXX@XXX";
  homeDirectory = "/home/${user}";
in {
  imports = [
    (import ./home.nix { inherit config pkgs user email homeDirectory; })
    (import ./git.nix { inherit config pkgs user email homeDirectory; })
    ./shell.nix
  ];
  # Various options that are specific for this machine/user.
  targets.genericLinux.enable = false; # For non-NixOS systems change to true
}
```

# Apply configuration changes
```bash
home-manager switch
```
