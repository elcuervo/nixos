{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix

    ./neovim.nix
    ./readline.nix
    ./starship.nix
  ];

  my = {
    modules = {
      neovim = {
        enable = lib.mkDefault true;
      };

      readline = {
        enable = lib.mkDefault true;
      };

      starship = {
        enable = lib.mkDefault true;
      };
    };
  };
}
