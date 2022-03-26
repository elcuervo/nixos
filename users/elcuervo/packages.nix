{ pkgs, lib, config, options, ... }:

let
   spotify-hd = pkgs.symlinkJoin {
    name = "spotify";
    paths = [ pkgs.spotify ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/spotify \
        --add-flags "--force-device-scale-factor=1.8"
    '';
  };
in


{
  config = with lib;
  {
    home-manager.users."${config.my.username}" = { config, ... }: {
      home = {
        packages = with pkgs; [
          (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" ]; })
          input-fonts
          font-awesome

          docker-compose
          lazygit
          ticker
          graphviz
          maim
          s3cmd
          xclip
          heroku
          nmap
          ticker
          gtop
          calcurse

          # QoL
          nixpkgs-fmt
          hyperfine

          tree-sitter
          nodejs # github copilot

          # extra language servers
          solargraph
          rnix-lsp
          terraform-lsp
          terraform-ls
          nodePackages.typescript
          nodePackages.typescript-language-server
          gopls

          # UI
          vlc
          bitwarden
          _1password-gui
          zulip
          slack
          tdesktop
          spotify-hd
        ];
      };
     };
   };
 }

