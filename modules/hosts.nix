{ inputs, config, den, ... }:
{
  den.hosts.x86_64-linux.bones.users.fido = { };
  den.hosts.x86_64-linux.laptop.users.fido = { };

  den.aspects.laptop.includes = [
    (den.aspects.diskito { device = "/dev/floppy"; })
  ];

  den.aspects.bones.includes = [
    (den.aspects.diskito { device = "/dev/floppy"; mountAt = "/mnt/A";})
  ];

  den.aspects.diskito = let 
    # two parametric aspects just like the ones you have

    # according to our tests/function_can_take.nix,
    # hw should not be invoked if the context is exactly `{ dev }`
    # other contexts like `{ dev, foo }` do not invoke hw
    hw = { device }: {
      nixos.diskito.device = device;
      nixos.diskito.mountPoint = "/";
    };

    # same, according to tests, vm is invoked only for `{ dev, mountAt }`
    vm = { device, mountAt }: {
      nixos.diskito.device = device;
      nixos.diskito.mountPoint = mountAt;
    };
  in {
    __functor = den.lib.parametric true;
    includes = [
       hw
       vm

       {
         nixos.imports = [ ./_diskito.nix ];
         nixos.diskito.name = "Small";
       }
    ];
  };
}
