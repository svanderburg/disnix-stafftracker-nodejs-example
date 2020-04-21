{infrastructure}:

let
  applicationServicesDistribution = import ./distribution.nix {
    inherit infrastructure;
  };
in
{
  mongodb = [ infrastructure.test1 infrastructure.test2 ];
} // applicationServicesDistribution
