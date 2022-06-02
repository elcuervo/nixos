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
                capslock = overload(ctrl_vim, esc)

                # ctrl_vim modifier layer; inherits from 'Ctrl' modifier layer

                [ctrl_vim:C]

                space = swap(vim_mode)

                # vim_mode modifier layer; also inherits from 'Ctrl' modifier layer

                [vim_mode:C]

                h = left
                j = down
                k = up
                l = right
                # forward word
                w = C-right
                # backward word
                b = C-left
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
