{ config, lib, pkgs, ... }:

{
  boot = {
    kernelModules = [ "kvm-intel" ];

    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];

      luks.devices.cryptdata.device = "/dev/disk/by-uuid/87842e2b-1ff9-4edc-aa67-513aaa005866";
    };

    loader.grub = {
      enable = true;
      version = 2;
      efiSupport = true;
      enableCryptodisk = true;
      device = "nodev";
    };
  };
}
