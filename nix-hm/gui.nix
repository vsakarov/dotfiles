{ config, pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;

  # Required to get the fonts installed by home-manager to be picked up by OS.
  fonts.fontconfig.enable = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs;
    [
      #  GUI
      bitwarden
      czkawka
      digikam
      emacs
      firefox
      gnome.gnome-tweaks
      meld
      joplin-desktop
      keepass
      languagetool
      unison
      wl-clipboard
      xclip
      xsel
      yubikey-manager-qt
      yubikey-personalization-gui
      yubioath-desktop
    ] ++ [
      #  Fonts
      # bakoma_ttf
      # cantarell_fonts
      cascadia-code
      corefonts
      dejavu_fonts
      # fira-code
      symbola
      # gentium
      # inconsolata
      # liberation_ttf
      # nerdfonts
      # powerline-fonts
      source-code-pro
      # terminus_font
      ubuntu_font_family
    ];
}
