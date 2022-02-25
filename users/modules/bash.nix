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
            enableCompletion = true;
            enableSyntaxHighlighting = true;

            history = {
              size = 10000000;
              save = 10000000;
              extended = true;
            };

            sessionVariables = {
              EDITOR = "vim";
              PAGER = "less";
              CLICOLOR = "1";
              GREP_COLOR = "1;33";
            };
          };
        };
      };
    };
}
