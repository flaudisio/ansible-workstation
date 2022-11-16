#!/bin/sh

set -ex

ansible-playbook --become --ask-become-pass "$@"
