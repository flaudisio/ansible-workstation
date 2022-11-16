#!/usr/bin/env bash

set -e
set -o pipefail

is_command()
{
    command -v "$1" > /dev/null 2>&1
}

check_sanity()
{
    if ! is_command curl ; then
        echo "'curl' not found; aborting" >&2
        exit 1
    fi

    if is_command pip && [[ -z "$FORCE_PIP_INSTALL" ]] ; then
        echo "pip already installed; aborting. Use \$FORCE_PIP_INSTALL to ignore this check." >&2
        exit 1
    fi
}

run()
{
    echo "+ $@" >&2
    "$@"
}

install_dependencies()
{
    echo "Installing dependencies"

    run sudo apt update
    run sudo apt install python3-distutils python3-testresources
}

install_pip()
{
    local pip_script_path="/tmp/get-pip.py"

    echo "Downloading get-pip.py"
    run curl --fail -L -o "$pip_script_path" https://bootstrap.pypa.io/get-pip.py

    echo "Installing pip for Python 3"
    run sudo -H python3 "$pip_script_path"
    run pip --version

    echo "Checking pip versions"
    run pip3 --version
    run pip --version

    echo
    echo "Awesome! Installation was successful!"
    echo "pip command path: $( command -v pip )"
    echo
}

install_virtualenv_packages()
{
    run sudo -H pip install -U virtualenv virtualenvwrapper
}

main()
{
    check_sanity

    echo "Starting installation steps"

    install_dependencies
    install_pip
    install_virtualenv_packages

    echo "Done."
}


main "$@"
