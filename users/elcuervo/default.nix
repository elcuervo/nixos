{ pkgs, inputs, system, lib, ... }:

let
  username = "elcuervo";
  fullname = "elcuervo";
in
{
  imports = [
    ../modules
  ];

  my = {
    username = "${username}";

    modules = { };
  };

  users = {
    users = {
      "${username}" = {
        description = "${fullname}";
        shell = pkgs.zsh;
        isNormalUser = true;
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
        ];
      };
    };
  };

  home-manager.users."${username}" = { config, ... }: {
    home = {
      homeDirectory = "/home/${username}";

      sessionPath = [
        "$HOME/.local/bin"
      ];
    };
  };
}
