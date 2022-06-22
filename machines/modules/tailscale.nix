{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.tailscale;

in

{
  options = with lib; {
    my = {
      modules = {
        tailscale = {
          enable = mkEnableOption ''
            Whether to enable tailscale module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      environment.systemPackages = [ pkgs.tailscale ];

      services = {
        tailscale = {
          enable = true;
        };
      };
    };
}
