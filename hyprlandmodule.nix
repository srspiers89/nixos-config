{config, pkgs, ...}:

{
  # Enable sddm
  services.displayManager.sddm.enable = true;
  # Enable hyprland
  programs.hyprland = {
    enable = true;
    # nvidiaPatches = true;
    xwayland.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.NVD_BACKEND = "direct";

  environment.systemPackages = with pkgs; [

    kitty
    nvidia-vaapi-driver
    waybar
    dunst
    libnotify
    swww
    rofi-wayland
    pcmanfm
    htop
    kdePackages.kate
  ];
}
