topLevel: {
  flake.modules = {
    nixos.development = {
      programs.adb.enable = true;
    };

    homeManager.development =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        android-translation-layer # Allows to run Android apps on Linux

        lyto # ADB wireless over QR (min. SDK for 11)
        gnirehtet # Tethering from PC to Android phones

        # There is currently a bug with android studio starting adb server,
        # so before starting studio start the adb server with `adb devices` 
        # in your terminal to view devices connected via usb correctly.
        android-studio # Official IDE for Android
        rogcat # Developer LOGcat wrap

        android-backup-extractor # ADB backup tool
        adbfs-rootless # Mount Android devices on Linux
        adbtuifm # ADB file manager via CLI
        android-file-transfer # ADB File manager via GUI

        spytrap-adb # Stalkware debugger
        universal-android-debloater # Debloate non-rooted Android devices

        scrcpy # Screen reproducer via CLI
        qtscrcpy # Screen reproducer GUI wrapper

        john # John the Ripper password cracker via CLI #TODO: maybe if should have his own page idk
        johnny # John the Ripper open-source GUI
      ];
    };
  };
}