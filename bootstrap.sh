#!/bin/sh

set -ex

sudo apt update

sudo apt install --no-install-recommends --yes \
    ca-certificates \
    curl \
    python \
    python-apt
