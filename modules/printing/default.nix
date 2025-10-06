{
  flake.modules.nixos.printing = 
  { pkgs, ... }: {
    services.printing = {
      enable = true;
      drivers = [ pkgs.epson-escpr ];
      cups-pdf.enable = true;
    };

    hardware.printers = {
      ensurePrinters = [
        {
          name = "EPSON L4160";
          location = "Laboratio superior";
          deviceUri = "dnssd://EPSON%20L4160%20Series._ipp._tcp.local/?uuid=cfe92100-67c4-11d4-a45f-e0bb9e4eb54a";
          model = "epson-inkjet-printer-escpr/Epson-L4160_Series-epson-escpr-en.ppd";
          ppdOptions = {
            PageSize = "A4";
          };
        }
      ];
      ensureDefaultPrinter = "EPSON L4160";
    };
  };
}