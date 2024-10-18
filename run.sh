#!/usr/bin/env bash

AnsibleOpts=()

[[ -z "$NO_SUDO" ]] && AnsibleOpts+=( --become --ask-become-pass )

set -e
set -o pipefail
set -x

ansible-playbook "${AnsibleOpts[@]}" "$@"
