#!/bin/sh

set -ex

exec ansible-playbook -bK playbook.yml -i inventory.ini "$@"
