{boot.supportedFilesystems = [ "ntfs" ];

  boot.kernelParams =
    [ "intel_idle.max_cstate=1" ]; # In case your laptop hangs randomly
  boot.loader = {
    efi = { canTouchEfiVariables = false; };
    grub = {
      efiSupport = true;
      efiInstallAsRemovable = true;
      device = "nodev";
      useOSProber = true;
      gfxmodeEfi = "1920x1080";
    };
  };}