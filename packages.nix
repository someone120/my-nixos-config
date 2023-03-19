{ config, pkgs, ... }: {
  # System packages
  environment.systemPackages = with pkgs; [
    obsidian
    qv2ray
    nixfmt
    obs-studio
    google-chrome
    ghc
    zsh
    xray
    clash
    v2ray-geoip
    v2ray-domain-list-community
    nyancat
    neovim
    python3
    nodejs
    rustup
    spotify
    tdesktop
    vscode
    android-studio
    syncthing
    docker
    keepassxc
    git
    gcc
    gdb
    kdeconnect
    vlc
    fzf
    hugo
    screen
    ipfs
    ibus-engines.rime
  ];
}
