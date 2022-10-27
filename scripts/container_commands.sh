#!/bin/bash

echo "Go to poetry virtual env and zip everything"
## Install libraries
/root/.local/bin/poetry install

## Update Pillow
echo "Remove Pillow installation"
/root/.local/bin/poetry remove Pillow


## Go to Poetry virtualenvs' folder and enter the first folder (which is the head -n 1 command)
cd /root/.cache/pypoetry/virtualenvs && cd $(ls -d */|head -n 1) \
  && echo "inside virtualenv >> " && ls && pwd

## Save the path to the poetry virtual environment
PYTHON_ENV=$PWD;

## Go to root
cd /root/

## Create a folder called python to contain the virtualenv content. Ps: This is an AWS Lambda Layer
## restriction. It will only work if the zipped folder is called "python" (at least for python3.8)
mkdir python

## Move the contents from the virtual env to the folder called "python"
mv $PYTHON_ENV/* python

## zip the entire folder called python to be a file called "python.zip"
zip -r python.zip python
