{ pkgs, lib, config, options, ... }:

{
  config = with lib;
    {
      home-manager.users."${config.my.username}" = { config, ... }: {
        programs = {
          firefox.enable = true;

          chromium.enable = true;

          home-manager.enable = true;

          ssh.enable = true;

          bat.enable = true;

          direnv.enable = true;

          jq.enable = true;

          exa = {
            enable = true;
            enableAliases = true;
          };

          neovim = import ./programs/neovim.nix { inherit pkgs lib; };
          fish = import ./programs/fish.nix { inherit pkgs lib; };
          tmux = import ./programs/tmux.nix { inherit pkgs; };

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

            extraConfig = {
              init = {
                defaultBranch = "main";
              };
            };
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
      };
    };
}

