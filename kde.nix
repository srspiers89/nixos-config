{config, pkgs, ...}:

{
  # Enable the KDE Plasme 6 Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}
