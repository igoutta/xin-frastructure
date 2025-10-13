{
  flake.modules = {
    homeManager.development =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          (python313.withPackages (
            ps: with ps; [
              # python language server
              pyright
              ruff

              pipx # Install and Run Python Applications in Isolated Environments
              black # python formatter
              uv # python project package manager

              # commonly used python packages
              jupyter
              ipython
              pandas
              requests
              pyquery
              pyyaml
              boto3 # AWS SDK
              protobuf # protocol buffer compiler
              numpy
              
              # my most used packages
              marimo
              polars
              plotly
              pymavlink
            ]
          ))

          marimo

          uv
          migrate-to-uv
        ];
      };
  };
}
