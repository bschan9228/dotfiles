{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [nvidia-vaapi-driver];
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true; # Set to false to use the proprietary kernel module
}
