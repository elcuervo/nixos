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
        isNormalUser = true;
	shell = pkgs.bash;
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

      direnv.enable = true;

      jq.enable = true;

      firefox.enable = true;

      exa = {
        enable = true;
        enableAliases = true;
      };

      bash = {
        enable = true;

        shellAliases = {
          g = "${pkgs.git}/bin/git";
          gs = "${pkgs.git}/bin/git status";
          gp = "${pkgs.git}/bin/git pull --rebase";

          cat = "${pkgs.bat}/bin/bat";
          lg = "${pkgs.lazygit}/bin/lazygit";

          tmn = "${pkgs.tmux}/bin/tmux -S /tmp/pair new-session -s $1";
          tma = "${pkgs.tmux}/bin/tmux -S /tmp/pair attach-session -t $1";
          tml = "${pkgs.tmux}/bin/tmux -S /tmp/pair list-sessions";

          md = "mkdir -pv";

          ":q" = "exit";
        };
      };

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

      packages = with pkgs; [
        lazygit
      ];

      sessionPath = [
        "$HOME/.local/bin"
      ];
    };
  };
}
