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

      neovim = {
        enable = true;
           vimAlias = true;
           vimdiffAlias = true;

           extraConfig = ''
             set number
             set ruler
             set tabstop=2
             set textwidth=100
             set colorcolumn=100
             set noswapfile
             set mouse=nvirh
             inoremap jk <ESC>
             nnoremap <Leader><space> :noh<cr>
             colorscheme gruvbox
             let g:gist_clip_command = 'xclip -selection clipboard'
             let g:gist_post_private = 1
             let g:lightline = {
             \ 'colorscheme': 'gruvbox',
             \ 'component_function': {
             \   'filename': 'LightlineFilename',
             \ },
             \ 'active': {
             \   'right': []
             \ }
             \ }
           '';

           plugins = with pkgs.vimPlugins; [
             supertab
             sensible
             gruvbox

             lightline-vim
             lightline-gruvbox-vim

             vim-fugitive
             webapi-vim
             vim-gist
             vim-tmux-navigator

             # Languages
             vim-endwise
             vim-ruby
             vim-rails
             vim-terraform

             vim-nix
           ];
      };

      tmux = {
        enable = true;
        baseIndex = 1;
        keyMode = "vi";
        historyLimit = 100000;
        terminal = "screen-256color";

        prefix = "C-a";

        extraConfig = ''
    bind-key R                refresh-client
    bind-key x                kill-pane
    bind-key C-a              last-window
    bind-key C-s              next-window
    bind-key C-d              previous-window
    bind-key |                split-window -h
    bind-key \\               split-window -h
    bind-key -                split-window -v
    bind p paste-buffer
    set -g set-clipboard on
    set -g mouse on
    # UI
    set-option -g status-left "#[bg=colour241,fg=colour248] #S #[bg=colour237,fg=colour241,nobold,noitalics,nounderscore]"
    # Current window
    set-window-option -g window-status-current-format "#[fg=colour237, bg=colour214, nobold, noitalics, nounderscore] #[fg=colour239, bg=colour214]#I #[fg=colour239, bg=colour214, bold]#[fg=colour214, bg=colour237, nobold, noitalics, nounderscore]"
    # Other windows
    set-window-option -g window-status-format "#[fg=colour237,bg=colour239,noitalics] #[fg=colour223,bg=colour239]#I #[fg=colour223, bg=colour239]#[fg=colour239, bg=colour237, noitalics]"
    # Right status
    set-option -g status-right "#[fg=colour239, bg=colour237, nobold, nounderscore, noitalics] #[fg=colour246,bg=colour239]#[fg=colour248, bg=colour239, nobold, noitalics, nounderscore] #[fg=colour237, bg=colour248] #h "
        '';

        plugins = with pkgs.tmuxPlugins; [
          yank
          sensible
          resurrect
          vim-tmux-navigator

          gruvbox
        ];

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
