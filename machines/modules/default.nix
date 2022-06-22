{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix

    ./boot.nix
    ./haveged.nix
    ./network.nix
    ./openssh.nix
    ./tailscale.nix
    ./timesyncd.nix
    ./tools.nix
    ./xserver.nix
    ./users.nix
  ];

  my = {
    modules = {
      boot = {
        enable = lib.mkDefault true;
      };

      haveged = {
        enable = lib.mkDefault true;
      };

      network = {
        enable = lib.mkDefault true;
      };

      openssh = {
        enable = lib.mkDefault true;
      };

      tailscale = {
        enable = lib.mkDefault true;
      };

      timesyncd = {
        enable = lib.mkDefault true;
      };

      tools = {
        enable = lib.mkDefault true;
      };

      xserver = {
        enable = lib.mkDefault true;
      };

      users = {
        enable = lib.mkDefault true;
      };
    };
  };
}
