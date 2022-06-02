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
        keyd = {
          enable = true;

          configuration = {
            default = {
              text = ''
                [ids]
                *
                [main]
                # Maps capslock to escape when pressed and control when held.
                capslock = overload(meta, esc)
              '';
            };
          };
        };

        xserver = {
          enable = true;

          displayManager.gdm.enable = true;
          desktopManager.gnome.enable = true;
        };
      };
    };
}
