{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.xserver;
in

{
  options = with lib; {
    my = {
      modules = {
        xserver = {
          enable = mkEnableOption ''
            Whether to enable xserver module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      services = {
        xserver = {
          enable = true;

          displayManager.gdm.enable = true;
          desktopManager.gnome.nable = true;
        };
      };
    };
}
