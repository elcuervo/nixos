{ pkgs, inputs, system, lib, ... }:

let
  username = "elcuervo";
  fullname = "elcuervo";
in
{
  imports = [
    ../modules

    ./packages.nix
    ./programs.nix
    ./services.nix
  ];

  my = {
    username = "${username}";

    modules = { };
  };

  users = {
    users = {
      "${username}" = {
        description = "${fullname}";
        isNormalUser = true;
        shell = pkgs.fish;
        hashedPassword = "$6$3jSyhppR3kO$n5O/iUU36U6MCHim83gbvf1rItoH5HDLTN/IDOZZnhs3ycE9f8piSgKHFleTLVtMnRK6kdXPZHAyQJTZhUTHk0";
        openssh = {
          authorizedKeys = {
            keys = [
              ""
            ];
          };
        };
        extraGroups = [
          "wheel"
          "docker"
          "networkmanager"
          "dialout"
          "vboxusers"
        ];
      };
    };
  };

  home-manager.users."${username}" = { pkgs, config, ... }: {
    gtk = {
      enable = true;

      gtk4 = {
        extraConfig = {
          gtk-application-prefer-dark-theme = true;
        };
      };
    };

    home = {
      homeDirectory = "/home/${username}";

      sessionVariables = {
        EDITOR = "nvim";
        TERMINAL = "alacritty";
        LIBGL_DRI3_DISABLE = true; # Magic env that fixes displaylink issues
      };

      keyboard = {
        options = [
          "ctrl:nocaps"
        ];
      };

      stateVersion = "22.05";

      sessionPath = [
        "$HOME/.local/bin"
      ];
    };
  };
}
