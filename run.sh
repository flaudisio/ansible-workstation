#!/bin/sh

set -ex

ansible-playbook -b -K -v playbook.yml -i inventory.ini "$@"
