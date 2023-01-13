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
          name = "howie";
          age  = 420;
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
