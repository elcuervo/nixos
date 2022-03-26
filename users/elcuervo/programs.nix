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

         tmux = import ./programs/tmux.nix { inherit pkgs; };

         bash = {
           enable = true;

           initExtra = ''
             . $HOME/.tokens
           '';

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

