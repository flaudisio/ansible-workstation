#!/usr/bin/env bash

set -e
set -o pipefail

VirtualenvDir="/var/tmp/ansible-workstation-temp-virtualenv"


check_sanity()
{
    for cmd in pip virtualenv ; do
        if ! command -v "$cmd" > /dev/null 2>&1 ; then
            echo "Command '$cmd' not found; aborting"
            exit 1
        fi
    done
}

run()
{
    echo "+ $@"
    "$@"
}

install_ansible()
{
    echo "Installing Ansible to '$VirtualenvDir'"
    run virtualenv "$VirtualenvDir"
    run . "$VirtualenvDir/bin/activate"
    run pip install "ansible==2.9.*"

    echo "Checking Ansible version"
    run ansible --version

    echo
    echo "Awesome! Installation was successful!"
    echo "Ansible command path: $( command -v ansible )"
    echo
    echo "Use this commands for using this Ansible installation:"
    echo
    echo ". $VirtualenvDir/bin/activate"
    echo
    echo "ansible --version"
    echo
    echo "For uninstalling Ansible, just run:"
    echo
    echo "rm -rf '$VirtualenvDir'"
    echo
}

main()
{
    check_sanity

    echo "Starting installation steps"

    install_ansible

    echo "Done."
}


main "$@"
