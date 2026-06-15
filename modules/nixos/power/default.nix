{ config, pkgs, ... }:

{
  services.logind.settings.Login = {
    IdleAction = "suspend";
    IdleActionSec = "30min";
  };
}
