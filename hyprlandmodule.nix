{config, pkgs, inputs, ...}:

{
  # Enable sddm
  services.displayManager.sddm.enable = true;
  # Enable hyprland
  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
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
