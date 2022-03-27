{ config, pkgs, ... }: {
  # For NixOS configuration.nix
  # # https://nixos.wiki/wiki/Yubikey
  # services.udev.packages = [ pkgs.yubikey-personalization ];
  # services.pcscd.enable = true; # Yubikey ssh piv

  # home.file.".ssh/opensc-pkcs11.so".source =
  #   "${pkgs.opensc}/lib/opensc-pkcs11.so";

  programs.ssh = {
    enable = true;
    forwardAgent = false;
    serverAliveInterval = 60;
    controlMaster = "auto";
    controlPath = "~/.ssh/sockets/%r@%h-%p";
    controlPersist = "600";

    extraConfig = ''
      PKCS11Provider ${pkgs.opensc}/lib/opensc-pkcs11.so
    '';

    # matchBlocks = { };
  };
}
