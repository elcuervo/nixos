{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.users;
in

{
  options = with lib; {
    my = {
      modules = {
        users = {
          enable = mkEnableOption ''
            Whether to enable users module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      users = {
        defaultUserShell = pkgs.bash;
        mutableUsers = false;

        users = {
          root = {
            shell = pkgs.bash;
            hashedPassword =
              "$6$dvnOxi7G.W8G$cTJj8.BX2LhmQmMQcQt5dB7IdvaruDY5QooWPmnq5qmvRBoZd9msPIDh/476JJuMiaJnqBsebV8HdOwJeXhMK/";
            openssh = {
              authorizedKeys = {
                keys = [
                  ""
                ];
              };
            };
          };
        };
      };
    };
}
