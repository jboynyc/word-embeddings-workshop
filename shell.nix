{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/20.09.tar.gz") {} }:

with pkgs;

  stdenv.mkDerivation rec {
  name = "env";
  env = buildEnv {
    name = name;
    paths = buildInputs;
  };
  buildInputs = with python38Packages; [
    # venvShellHook
    gensim
    scikitlearn
    jupyterlab
    pandas
    matplotlib
    altair
    seaborn
  ];
  # venvDir = "./VENV";
  # postShellHook = ''
  #   python -m ipykernel install --user --name=emb-workshop
  #   pip install whatlies
  # '';
  }
