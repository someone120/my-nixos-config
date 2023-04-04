{ config, pkgs, ... }: {
  # System packages
  environment.systemPackages = with pkgs; [
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
    v2ray-geoip
    v2ray-domain-list-community
    nyancat
    neovim
    python3
    python310Packages.pip
    conda
    nodejs
    # nodejs-16_x
    rustup
    spotify
    tdesktop
    vscode
    android-studio
    syncthing
    element-desktop
    docker
    thunderbird
    anki-bin
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
    # nodePackages.yarn
    yarn
  ];
}
