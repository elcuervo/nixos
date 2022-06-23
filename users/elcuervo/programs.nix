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
          exa.enable = true;

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

            delta.enable = true;

            aliases = {
              ci = "commit";
              di = "diff";
              st = "status";
              co = "checkout";
              br = "branch";
              pu = "push";
              pl = "pull";
              cat = "cat-file -p";
              rc = "rebase --continue";
              rs = "rebase --skip";

              unstage = "reset HEAD";
              uncommit = "reset --soft HEAD^";

              tags = "tag -l";
              branches = "branch -a";
              remotes = "remote -v";

              amend = "commit --amend -C HEAD";
            };

            ignores = [
              ".DS_Store"
              ".direnv"
            ];

            extraConfig = {
              commit.gpgsign = true;
              user.signingkey = "3A54A34CDE205745";

              core = {
                quotepath = false;
              };

              init = {
                defaultBranch = "main";
              };

              github = {
                user = "elcuervo";
              };

              pager = {
                branch = false;
              };

              push = {
                default = "simple";
              };

              format = {
                signoff = true;
              };
            };

            lfs = {
              enable = true;
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

