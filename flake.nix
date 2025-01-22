{
  description = "IMPHNEN NIX Node Builder";

  inputs = {nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";};

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [];
      systems = ["aarch64-darwin" "x86_64-darwin" "x86_64-linux" "aarch64-linux"];
      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
        packages = {
          nodejs16-darwin-arm64 = pkgs.stdenv.mkDerivation {
            name = "nodejs22.6.0-darwin-arm64";
            src = pkgs.fetchurl {
              url = "https://nodejs.org/dist/v22.6.0/node-v22.6.0-darwin-arm64.tar.gz";
              sha256 = "sha256-nqYHZoB808OjrWrUGfmJGNY0pg/o3qW5wHUH7Q8XbUw=";
            };
            installPhase = ''
              echo "installing nodejs"
              mkdir -p $out
              cp -r ./ $out/
            '';
          };

          nodejs16-darwin-x64 = pkgs.stdenv.mkDerivation {
            name = "nodejs22.6.0-darwin-x64";
            src = pkgs.fetchurl {
              url = "https://nodejs.org/dist/v22.6.0/node-v22.6.0-darwin-x64.tar.gz";
              sha256 = "sha256-N+CajPI1LzQNEgTGFUBY2BNi/vTsSIsBl7LONrPwNno=";
            };
            installPhase = ''
              echo "installing nodejs"
              mkdir -p $out
              cp -r ./ $out/
            '';
          };

          nodejs16-linux-x64 = pkgs.stdenv.mkDerivation {
            name = "nodejs22.6.0-linux-x64";
            src = pkgs.fetchurl {
              url = "https://nodejs.org/dist/v22.6.0/node-v22.6.0-linux-x64.tar.gz";
              sha256 = "sha256-8vTMvLwKRD5frevRFJoi+WCH7AnO9S/zQ6Fe6DUgbZY=";
            };
            installPhase = ''
              echo "installing nodejs"
              mkdir -p $out
              cp -r ./ $out/
            '';
          };

          nodejs16-linux-arm64 = pkgs.stdenv.mkDerivation {
            name = "nodejs22.6.0-linux-arm64";
            src = pkgs.fetchurl {
              url = "https://nodejs.org/dist/v22.6.0/node-v22.6.0-linux-arm64.tar.gz";
              sha256 = "sha256-RuOFf1VSq9NtlUg4DXlbBDo87sJQTmn+GnVPp2AS2q8=";
            };
            installPhase = ''
              echo "installing nodejs"
              mkdir -p $out
              cp -r ./ $out/
            '';
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = [
            (
              if system == "aarch64-linux"
              then self'.packages.nodejs16-linux-arm64
              else if system == "aarch64-darwin"
              then self'.packages.nodejs16-darwin-arm64
              else if system == "x86_64-linux"
              then self'.packages.nodejs16-linux-x64
              else if system == "x86_64-darwin"
              then self'.packages.nodejs16-darwin-x64
              else null
            )
            pkgs.gnused
            pkgs.docker
            pkgs.nodePackages.node-gyp-build
            pkgs.nodePackages.yarn
            pkgs.nodePackages."dockerfile-language-server-nodejs"
            pkgs.nodePackages."typescript"
            pkgs.nodePackages."typescript-language-server"
            pkgs.nodePackages."vscode-langservers-extracted"
            pkgs.nodePackages."@tailwindcss/language-server"
            pkgs.emmet-ls
          ];
        };
      };
      flake = {};
    };
}
