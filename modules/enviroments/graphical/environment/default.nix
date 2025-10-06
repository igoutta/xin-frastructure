{
  inputs,
  ...
}:
{
  flake.modules = {
    nixos.environments.graphical =
      { pkgs, ... }:
      {
        xdg = {
          portal = {
            enable = true;
            config.common.default = "kde";
            extraPortals = with pkgs; [ kdePackages.xdg-desktop-portal-kde ];
          };
        };

        services = {
          xserver = {
            enable = true;
            xkb = {
              model = "asus_laptop"; #TODO: move to host TUF
              layouts = "latam,latam(dvorak)";
              options = "grp:alt_caps_toggle,grp:win_space_toggle,grp_led:scroll";
            };
          };
          desktopManager = {
            plasma6 = {
              enable = true;
            };
          };
          displayManager = {
            sddm = {
              enable = true;
              wayland.enable = true;
            };
          };
        };
      };

    homeManager.desktop =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        nixpkgs = {
          config.allowUnfree = true;
          overlays = [
            inputs.self.overlays.default
          ];
        };

        home = {
          activation = {
            # Remove ksycoca cache on activation
            # So that KDE applications can pick up new .desktop files
            # And it doesn't break my favorite applications shortcuts
            nuke-ksycoca = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
              rm -fv ${config.xdg.cacheHome}/ksycoca*
            '';
          };

          packages = with pkgs; [
            kdePackages.akonadi-search
            kdePackages.akregator
            kdePackages.ark
            kdePackages.filelight
            kdePackages.kamoso
            kdePackages.kate
            kdePackages.kate
            kdePackages.kcalc
            kdePackages.kdialog
            kdePackages.kgpg
            kdePackages.kpipewire
            kdePackages.krdc
            kdePackages.krfb
            kdePackages.ksystemlog
            kdePackages.kweather
            kdePackages.okular
            kdePackages.plasma-browser-integration
            kdePackages.sddm-kcm
            kdePackages.spectacle
            kdePackages.xdg-desktop-portal-kde
            kdePackages.yakuake
            krita
            vlc
            zotero
            pkgs.local.gh-flake-update
          ];
        };
      };
  };
}
