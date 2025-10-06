{
  flake.modules.nixos.core = {
    services.xserver.xkb = {
      layout = "latam";
      variant = "";
    };
    console.keyMap = "la-latin1";
  };
}