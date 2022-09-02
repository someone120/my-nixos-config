# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nix.settings.substituters =
    [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./packages.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  # 时区
  time.timeZone = "Asia/Shanghai";

  # 双系统改为本地时间保持同步（不推荐了）
  # time.hardwareClockInLocalTime = true;
  # 把 Windows 时间改成 UTC 就不需要这个配置了（看文末附录）

  # 语言支持和输入法
  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ libpinyin ];
  };

  # 中文字体
  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      hack-font
    ];
  };

  # 桌面系统不用费心配置网络，直接交给 NetworkManager 管理
  networking.networkmanager.enable = true;

  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;

  # Optionally, you may need to select the appropriate driver version for your specific GPU.
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  users.users.someone = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "ys";
      plugins = [ "git" "python" "man" ];
    };
  };
  systemd.services.clash = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.clash}/bin/clash -d /home/someone/clash";
      ExecStop = "kill `ps -a | grep clash |awk '{print $1}'`";
    };
  };
}

