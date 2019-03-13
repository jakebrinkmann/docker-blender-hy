#!/usr/bin/env bash

# Update package-manager mirrors/metadata
apt-get update --assume-yes

# Install our dependencies
apt-get install --assume-yes \
        blender=2.79.b \
        python3-pip=9.0.1-2

# TODO: use pipenv?
pip install --no-cache \
    hylang==0.16.0
