{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix

    ./neovim.nix
    ./readline.nix
  ];

  my = {
    modules = {
      neovim = {
        enable = lib.mkDefault true;
      };

      readline = {
        enable = lib.mkDefault true;
      };

    };
  };
}
