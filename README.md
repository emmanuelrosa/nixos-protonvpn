# nixos-protonvpn

`nixos-protonvpn` is a ProtonVPN module for NixOS providing a simple declarative configuration method. It's currently a facade for OpenVPN. Free and paid VPN servers are supported.

Note that this module only provides basic VPN functionality. Advanced ProtonVPN features such as "Kill Switch" are not provided by this module. Of course, feel free to submit improvements. For instance, I would like to reimplement this using WireGuard.

## Installation (in configuration.nix) using flakes

```
inputs.protonvpn.url = "github:emmanuelrosa/nixos-protonvpn";
inputs.protonvpn.inputs.nixpkgs.follows = "nixpkgs";
```

## Example configuration #1

This example configures a VPN connection with a US server (in a paid plan), using an authentication method which stores the credentials in the Nix store, in plain text.

```
services.protonvpn = {
  enable = true;
  autoStart = true;
  authentication = { username = "john"; password = "galt" };
  server = "us.protonvpn.com";
};
```

## Example configuration #2

This example configures a VPN connection which is deactivated by default, using an authentication method that reads the credentials from the specified file. I recommend this method, espcially when used with agenix (https://github.com/ryantm/agenix) to store the credentials securely.

```
services.protonvpn = {
  enable = true;
  autoStart = false;
  authentication = "/root/vpn-credentials.txt;
  server = "us.protonvpn.com";
};
```
