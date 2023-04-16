{ config, pkgs, ... }: {
  nixpkgs.overlays = [
    (
      final: prev: {
        nodejs = prev.nodejs-16_x;
      }
    )

  ];
  nixpkgs.config.packageOverrides = pkgs: rec { vscodeCpp = pkgs.vscode-with-extensions.override { vscodeExtensions = vscode-extensions: with vscode-extensions; [ ms-vscode.cpptools ]; }; };
}

