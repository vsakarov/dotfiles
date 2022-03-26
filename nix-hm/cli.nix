{ config, pkgs, ... }: {

  home.file.".vimrc".source = ../vimrc;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    git
    jq
    kubectl
    magic-wormhole
    neovim
    nmap
    pass
    speedread
  ];
}
