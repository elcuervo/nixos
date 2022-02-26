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

  home-manager.users."${username}" = { pkgs, config, ... }: {
    programs = {
      home-manager.enable = true;

      ssh.enable = true;

      bat.enable = true;

      exa = {
        enable = true;
        enableAliases = true;
      };

      jq.enable = true;

      firefox.enable = true;

      gh = {
        enable = true;
	settings = {
          editor = "nvim";
          git_protocol = "ssh";
        };
      };

      git = {
        enable = true;
	userName = "elcuervo";
        userEmail = "elcuervo@elcuervo.net";
      };

      alacritty = {
        enable = true;

	settings = {
	  window = {
	    startup_mode = "Fullscreen";
	  };
	};
      };
    };

    home = {
      homeDirectory = "/home/${username}";

      packages = [
        pkgs.lazygit
      ];

      sessionPath = [
        "$HOME/.local/bin"
      ];
    };
  };
}
