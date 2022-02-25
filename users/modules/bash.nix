{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.bash;
in

{
  options = with lib; {
    my = {
      modules = {
        bash = {
          enable = mkEnableOption ''
            Whether to enable zsh module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      home-manager.users."${config.my.username}" = { config, ... }: {
        programs = {
          bash = {
            enable = true;
          };
        };
      };
    };
}
