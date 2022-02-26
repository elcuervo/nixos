{ pkgs, lib, config, options, ... }:

{
  config = with lib;
  {
    home-manager.users."${config.my.username}" = { config, ... }: {
      services = {
        gpg-agent = {
          enable = true;
          enableSshSupport = true;
        };
      };
    };
  };
}

