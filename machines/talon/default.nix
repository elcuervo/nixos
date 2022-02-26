{ config, lib, pkgs, ... }:

{
  imports = [
    ../modules

    ./filesystems.nix
    ./boot.nix
    ./hardware.nix
    ./networking.nix
  ];

  virtualisation.docker.enable = true;

  system = {
    stateVersion = "21.11";
  };
}
