{ config, pkgs, ... }:

{
  xsession.initExtra = ''
    xset dpms 900 900 900
    xset s 900 900
  '';
}
