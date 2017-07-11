#!/bin/sh

set -e

main()
{
    sudo apt update

    sudo apt install --no-install-recommends --yes \
        ca-certificates \
        curl \
        python \
        python-apt \
        software-properties-common

    if ! dpkg-query --show ansible ; then
        sudo add-apt-repository --yes ppa:ansible/ansible
        sudo apt update
        sudo apt install --no-install-recommends ansible
    fi

    ansible --version
    ansible-galaxy install --force -r requirements.yml -p roles/
}

echo "Starting in 3 seconds..."
echo

(
    set -x
    sleep 3
    main
)

echo
echo "Done!"
