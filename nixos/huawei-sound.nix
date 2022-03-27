{ config, pkgs, ... }:
let
  huawei-sound = pkgs.fetchurl {
    url =
      "https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1721987/+attachment/5234959/+files/huawei-sound.sh";
    sha256 =
      "sha256:c8225593ae74fc8048a985d610d42d441fc3a89c592c39f8bfeec3886c7bb4b8";
  };
in {
  systemd.services.huawei-sound = {
    enable = true;
    description = "Huawei MateBook X sound fix";
    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash ${huawei-sound}";
      Type = "idle";
    };
    path = with pkgs; [ bash alsa-tools ];
    wantedBy = [ "multi-user.target" "sleep.target" ];
  };
}
