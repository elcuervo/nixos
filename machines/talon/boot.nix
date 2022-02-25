{ config, lib, pkgs, ... }:

{
  boot = {
    kernelModules = [ "kvm-intel" ];

    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];

      luks.devices.cryptdata.device = "/dev/nvme0n1p2";
    };
  };
}
