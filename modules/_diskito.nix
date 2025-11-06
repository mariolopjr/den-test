{ lib, ... }:
{
  options.diskito.disks = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule {
      options.name = lib.mkOption { type = lib.types.str; };
      options.device = lib.mkOption { type = lib.types.str; };
      options.mountPoint = lib.mkOption { type = lib.types.str; };
    });
  };
}
