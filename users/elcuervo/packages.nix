{ pkgs, lib, config, options, ... }:

{
  config = with lib;
  {
    home-manager.users."${config.my.username}" = { config, ... }: {
      home = {
        packages = with pkgs; [
          (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" ]; })
          input-fonts
          font-awesome

          lazygit
          ticker
          graphviz
          maim
          s3cmd
          xclip
          heroku
          nmap
          ticker
          gtop
          calcurse

          # UI
          vlc
          bitwarden
          _1password-gui
          zulip
          slack
          tdesktop
        ];
      };
     };
   };
 }

