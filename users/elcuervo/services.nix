{ pkgs, lib, config, options, ... }:

{
  config = with lib;
    {
      home-manager.users."${config.my.username}" = { config, ... }: {
        dconf.settings = {
          "org/gnome/settings-daemon/plugins/media-keys" = {
            custom-keybindings = [
              "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
              "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
              "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
              "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
            ];
          };

          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
            binding = "<Alt>2";
            command = "wmctrl -a Firefox";
            name = "focus-browser";
          };

          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
            binding = "<Alt>3";
            command = "wmctrl -a Slack";
            name = "focus-slack";
          };

          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
            binding = "<Alt>d";
            command = "wofi --show drun";
            name = "launcher";
          };

          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
            binding = "<Alt>4";
            command = "wmctrl -a Telegram";
            name = "focus-telegram";
          };
        };

        services = {
          gpg-agent = {
            enable = true;
            enableSshSupport = true;
          };
        };
      };
    };
}

