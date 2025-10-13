{
  flake.modules.nixos.containing = 
  { pkgs, ... }: 
  {
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          vhostUserPackages = [ pkgs.virtiofsd ];
          runAsRoot = true;
          swtpm.enable = true;
          ovmf = {
            enable = true;
            packages = [(pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd];
          };
        };
      };

      # Enable common container config files in /etc/containers
      containers.enable = true;

      podman = {
        enable = true;
        dockerCompat = true; # Create a `docker` alias for podman, to use it as a drop-in replacement
        dockerSocket.enable = true;
        defaultNetwork.settings.dns_enabled = true;
        extraPackages = with pkgs; [
          #qemu # needed to build the podman machine
          virtiofsd # needed to start the podman machine
          dive # look into docker image layers
          gvisor # Application Kernel for Containers
          podman-tui # status of containers in the terminal
          #docker-compose # start group of containers for dev
          podman-compose # start group of containers for dev
        ];
      };
    };
  };
}
