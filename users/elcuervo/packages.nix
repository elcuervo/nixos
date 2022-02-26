{ pkgs, lib, config, options, ... }:

{
  config = with lib;
  {
    home-manager.users."${config.my.username}" = { config, ... }: {
      home = {
        packages = with pkgs; [
          lazygit

          # UI
          zulip
          slack
          tdesktop
        ];
      };
     };
   };
 }

