{
  flake.modules = {
    homeManager.gui = 
    { pkgs, ...}: 
    {
      programs.obs-studio = {
        enable = true;

        plugins = with pkgs.obs-studio-plugins; [
          # wlrobs  # screen capture wlroots-based waylands compositors

          ditroav
          obs-teleport

          # obs-hyperion
          droidcam-obs

          obs-vkcapture
          obs-gstreamer

          input-overlay
          obs-multi-rtmp
          obs-source-clone
          obs-shaderfilter
          obs-vintage-filter
          obs-source-record
          obs-livesplit-one
          looking-glass-obs
          obs-command-source
          obs-move-transition
          obs-backgroundremoval
          # advanced-scene-switcher

          obs-mute-filter
          obs-pipewire-audio-capture

          obs-nvfbc
          obs-vaapi
          obs-3d-effect

          obs-retro-effects
          pixel-art
        ];
      };
    };
  };
}