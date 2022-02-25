{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "talon";

    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];

    interfaces.wlp0s20f3.useDHCP = true;
  };
}
