#!/bin/sh

set -ex

ansible-playbook --become --ask-become-pass --verbose --inventory inventory.ini playbook.yml "$@"
