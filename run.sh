#!/bin/sh

set -ex

ansible-playbook --connection local --become --ask-become-pass --verbose --inventory inventory.ini "$@"
