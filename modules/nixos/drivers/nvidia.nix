{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [nvidia-vaapi-driver];
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  # https://discourse.nixos.org/t/gnome-gdm-glitches-after-suspending-sleep/52410/21
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    open = true;
    modesetting.enable = true;

    powerManagement = {
      enable = true;
#      finegrained = false;
    };
  };
}
