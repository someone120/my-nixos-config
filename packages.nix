{ config, pkgs, ... }: {
  # System packages
  environment.systemPackages = with pkgs; [
    nixfmt
    obs-studio
    google-chrome
    ghc
    zsh
    clash
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
    keepassxc
    git
    gcc
    gdb
    vlc
    fzf
    hugo
    screen
    ipfs
    ibus-engines.rime
  ];
}
