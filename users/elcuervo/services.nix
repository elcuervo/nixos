{ pkgs, lib, config, options, ... }:

{
  config = with lib;
    {
      home-manager.users."${config.my.username}" = { config, ... }: {
        dconf.settings = {
          "org/gnome/settings-daemon/plugins/media-keys" = {
            custom-keybindings = [
              "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
            ];
          };

          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
            binding = "<Alt>2";
            command = "wmctrl -a Firefox";
            name = "focus-browser";
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

