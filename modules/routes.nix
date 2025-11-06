{ pro, ... }:
{
  # set global static settings
  den.default = {
    darwin.system.stateVersion = 6;
    nixos.system.stateVersion = "25.11";
    homeManager.home.stateVersion = "25.11";
  };

  den.default.includes = [
    pro.host-name
  ];
}
