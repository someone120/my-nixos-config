{ config, pkgs, ... }: {
  # System packages
  environment.systemPackages = with pkgs; [
    ffmpeg
    obsidian
    jetbrains-mono
    qv2ray
    nixpkgs-fmt
    obs-studio
    google-chrome
    ghc
    zsh
    xray
    clash
    albert
    v2ray-geoip
    v2ray-domain-list-community
    nyancat
    neovim
    lm_sensors
    python3
    python310Packages.pip
    conda
    nodejs
    pkg-config
    # nodejs-16_x
    rustup
    spotify
    tdesktop
    vscode
    android-studio
    syncthing
    element-desktop
    docker
    thunderbird-bin
    anki-bin
    keepassxc
    git
    gcc
    gdb
    gnome.pomodoro
    kdeconnect
    vlc
    fzf
    hugo
    screen
    ipfs
    ibus-engines.rime
    # nodePackages.yarn
    yarn
    patchelf
    glibc

    (vscode-with-extensions.override {

      vscodeExtensions = with vscode-extensions; [
        ms-vscode.cpptools
      ];
    })
  ];
}
