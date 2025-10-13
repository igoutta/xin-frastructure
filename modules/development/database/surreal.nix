
{
  flake.modules = {
    nixos.development = {
      services.surrealdb = {
        enable = true;
        dbPath = "surrealkv:///var/lib/surrealdb/";
        extraFlags = [
          "--log"
          "debug"
          "--no-banner"
          "--user"
          "root"
          "--pass"
          "root"
        ]; #TODO: change user, pass and secret it
      };
    };

    homeManager.development =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [ surrealist surrealdb-migrations ];
    };
  };
}