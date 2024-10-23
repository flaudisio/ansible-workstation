#!/usr/bin/env bash
#
# Inspired by: https://askubuntu.com/a/299578
#
##

set -o pipefail


function _msg()
{
    echo -e "$*" >&2
}

function _run()
{
    _msg "+ $*"

    "$@" && return 0

    _msg "Error running command; exiting"
    exit 1
}

function main()
{
    if [[ -z "$1" || -z "$2" ]] ; then
        _msg "Usage: $0 <pool> <file>"
        exit 2
    fi

    local -r pool_name="$1"
    local -r volume_file="$2"

    local volume_name
    local volume_size_bytes

    if [[ ! -r "$volume_file" ]] ; then
        _msg "Error: volume file '$volume_file' could not be read or does not exist"
        exit 1
    fi

    if ! volume_name="$( basename "$volume_file" )" ; then
        _msg "Error: could not get volume name"
        exit 1
    fi

    if ! volume_size_bytes="$( stat --dereference --format '%s' "$volume_file" )" ; then
        _msg "Error: could not get volume size"
        exit 1
    fi

    _msg "Creating volume '$volume_name' in pool '$pool_name'"

    _run virsh --debug 4 vol-create-as "$pool_name" "$volume_name" "$volume_size_bytes"

    _msg "Getting volume info"

    _run virsh vol-list --pool "$pool_name"
    _run virsh vol-info --pool "$pool_name" "$volume_name"

    _msg "Uploading volume file '$volume_file' to libvirt pool '$pool_name'"

    _run virsh vol-upload "$volume_name" "$volume_file" --pool "$pool_name"

    _msg "Getting volume info"

    _run virsh vol-list --pool "$pool_name"
    _run virsh vol-info --pool "$pool_name" "$volume_name"

    _msg "Success!"
}


main "$@"
