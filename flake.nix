{
  description = "A template for Nix based C++ project setup.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/23.05";
    broccoli.url = "github:Sooyka/sturdy-broccoli";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, broccoli, ... }@inputs: inputs.utils.lib.eachSystem [
    "x86_64-linux" "aarch64-linux"
  ] (system: let
    pkgs = import nixpkgs {
      inherit system;
      # config.allowUnfree = true;
    };
  in {
    packages.default = pkgs.stdenv.mkDerivation rec {
      pname = "train";
      version = "0.1.0";
      
      src = ./.;

      nativeBuildInputs = [ pkgs.cmake ];
      buildInputs = [ broccoli.packages.${system}.default ];

      cmakeFlags = [
        "-DENABLE_TESTING=OFF"
        "-DENABLE_INSTALL=ON"
      ];
    };
  });
}