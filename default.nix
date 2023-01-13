# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

{ nixpkgs ? builtins.getFlake "nixpkgs"
, lib     ? nixpkgs.lib
}: let

  nt = lib.types;

# ---------------------------------------------------------------------------- #

  mod = lib.evalModules {
    modules = [
      ./modules/people.nix
      {
        person = { config, ... }: {
          options.age = lib.mkOption {
            description = ''
              Count of orbits made by Earth around it's Sun after a
              person's construction.
            '';
            type    = nt.int;
            default = 0;
          };
        };
      }
      {
        people.howie = {
          name = "howie";  # Defined in "base" module.
          age  = 420;      # Our extension.
        };
      }
    ];
  };


# ---------------------------------------------------------------------------- #

# _module, config, extendModules, options, type
in {
  inherit mod;
}

# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
