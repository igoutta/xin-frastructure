{
  flake.modules = {
    nixos.gui = 
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        efibootmgr

        wget
        curl
        wireguard-tools
      ]; #TODO: make shells
    };

    homeManager.gui = {
      home.packages = with pkgs; [
        #vkd3d
        #protontricks
        #zenity #YAD replacement

        nnn # terminal file manager
        yazi-unwrapped

        # archives
        zip
        xz
        unzip
        p7zip
        unrar
        peazip

        # documents
        pdf4qt
        papers

        # multimedia
        photoqt
        #tacentview
        rapid-photo-downloader
        qstopmotion
        
        # camera media
        tuicam
        cameractrls-gtk4
        cameradar # RTSP stream access tool

        #creative
        inkscape-with-extensions
        musescore

        # 3D
        f3d
        # exhibit
        prusa-slicer
        orca-slicer
        #snapmaker-luban #INSECURE. Reason: CVE-2023-5217

        # utils
        jq # A lightweight and flexible command-line JSON processor
        fx # Advanced JSON viewer
        yq-go # yaml processor https://github.com/mikefarah/yq
        lshw-gui # Details of hardware configuration
        libqalculate
        qalculate-qt # Calculator

        # networking tools
        iperf3
        dnsutils  # `dig` + `nslookup`
        ldns # replacement of `dig`, it provide the command `drill`
        aria2 # A lightweight multi-protocol & multi-source command-line download utility
        netcat # nc from LibreSSL
        socat # replacement of openbsd-netcat
        websocat
        nmap # A utility for network discovery and security auditing
        ipcalc  # it is a calculator for the IPv4/v6 addresses

        # downloads
        qbittorrent-enhanced

        # misc
        #googleearth-pro #INSECURE.
        asciiquarium-transparent
        cowsay
        file
        which
        tree
        gnused
        gnutar
        gawk
        zstd

        # nix related
        #
        # it provides the command `nom` works just like `nix`
        # with more details log output
        nix-output-monitor

        # productivity
        hugo # static site generator
        glow # markdown previewer in terminal
        batmon # Battery monitoring
        iotop # io monitoring
        iftop # network monitoring
        usbtop # TODO: research
        usbview

        # system call monitoring
        strace # system call monitoring
        ltrace # library call monitoring
        lsof # list open files

        # system tools
        sysstat
        lm_sensors # for `sensors` command
        ethtool
        pciutils # lspci
        usbutils # lsusb

        # electronics boards
        hevi # Advanced HEX reader
        arduino-cli
        arduino-ide
        arduino-language-server
        teensyduino
        wiringpi
        fritzing
        simulide_1_2_0

        # drones
        mission-planner
        qgroundcontrol

        # whatsapp
        whatsapp-emoji-font
        wasistlos

        # Containers    
        kail # Kubernets CLI manager

        rustdesk
      ];
    };
  };
}
