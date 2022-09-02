{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixfmt
    obs-studio
    ghc
    zsh
    clash
    nyancat
    neovim
    firefox
    python3
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
  ];
}
