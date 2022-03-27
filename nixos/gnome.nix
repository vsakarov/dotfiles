{ config, pkgs, user, ... }: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = user;

  services.xserver.desktopManager.gnome = {
    extraGSettingsOverrides = ''
      # Change default background
      # [org.gnome.desktop.background]
      # picture-uri='file://${pkgs.nixos-artwork.wallpapers.mosaic-blue.gnomeFilePath}'

      # Favorite apps in gnome-shell
      # [org.gnome.shell]
      # favorite-apps=['org.gnome.Photos.desktop', 'org.gnome.Nautilus.desktop']

      # https://github.com/NixOS/nixpkgs/issues/66554
      # gsettings reset org.gnome.desktop.input-sources sources
      # gsettings reset org.gnome.desktop.input-sources xkb-options
      [org.gnome.desktop.input-sources]
      xkb-options=['ctrl:nocaps']
      sources=[('xkb', 'us'), ('xkb', 'bg')]
    '';

    extraGSettingsOverridePackages = [
      pkgs.gsettings-desktop-schemas # for org.gnome.desktop
      pkgs.gnome.gnome-shell # for org.gnome.shell
    ];
  };

  # Configure keymap in X11
  # services.xserver.layout = "us,bg";
  # services.xserver.xkbOptions = "ctrl:nocaps";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  hardware.pulseaudio.enable = false;

  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.tapping = true;
}
