# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

{ lib, options, config, ... }: let

  nt = lib.types;

in {

# ---------------------------------------------------------------------------- #

  options.person = lib.mkOption {
    description = "A individual person";
    type        = nt.deferredModule;
    default = {
      options.species = lib.mkOption {
        description = ''
          Default is wiped out by "base" definition defined later.
          This option will be deleted entirely and won't merge with
          other declarations.
        '';
        type    = nt.str;
        default = "human";
      };
    };
  };


  options.people = lib.mkOption {
    description = "A collection of persons.";
    default     = {};
    type        = nt.lazyAttrsOf ( nt.submodule {
      imports = [config.person];
    } );
  };


# ---------------------------------------------------------------------------- #

  # Base sub-module
  config.person = { config, ... }: {
    options.name = lib.mkOption {
      description = "Moniker used to identify a person in a clique.";
      type        = nt.str;
    };
  };


# ---------------------------------------------------------------------------- #

}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
