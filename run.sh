#!/bin/sh

set -ex

ansible-playbook --connection local --become --ask-become-pass --inventory inventory.ini "$@"
