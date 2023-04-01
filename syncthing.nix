{ config, pkgs, ... }:{
services = {
    syncthing = {
        enable = true;
        user = "someone";
        dataDir = "/home/someone/";    # Default folder for new synced folders
        configDir = "/home/someone/.config/syncthing";   # Folder for Syncthing's settings and keys
    };
};
}