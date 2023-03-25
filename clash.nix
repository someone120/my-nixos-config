{ config, pkgs, ... }: {
systemd.services.clash = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    description = "Start the clash client.";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.clash}/bin/clash -d /home/someone/clash";
      ExecStop = "kill $MAINPID";
    };
  };  
}