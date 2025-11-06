{ lib, ... }:
{
  options.diskito.name = lib.mkOption { type = lib.types.str; };
  options.diskito.device = lib.mkOption { type = lib.types.str; };
  options.diskito.mountPoint = lib.mkOption { type = lib.types.str; };
}
