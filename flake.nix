{
  description = "A ProtonVPN module for NixOS";

  outputs = { self, nixpkgs }:
  {
    nixosModules.protonvpn = import ./modules/protonvpn.nix;
  };
}
