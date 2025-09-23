{ pkgs, ... }:
{
  home.packages = with pkgs; [
    godot
    graphics_gd
  ];

  home.sessionVariables = {
    GDTOOLCHAIN = "local";
  };

  home.file.".local/share/godot/export_templates".source =
    "${pkgs.godot-export-templates-bin}/share/godot/export_templates";
}
