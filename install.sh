#!/usr/bin/env bash

# Update package-manager mirrors/metadata
apt-get update --assume-yes

apt-get install --assume-yes \
        blender \
        python3-pip

pip install --no-cache \
    hylang
