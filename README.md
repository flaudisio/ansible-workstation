# Ansible Workstation

Ansible playbooks and roles that I use to provision my Linux-based machines.

## Compatibility

This repository is currently tested against **Xubuntu 24.04** (x86_64), but most roles should work with any Ubuntu flavor
running the same version.

## Prerequisites

- Git
- Python [venv](https://docs.python.org/3/library/venv.html) module

The installation steps below take care of bootstrapping a default (X)Ubuntu installation.

## Installation

Initial setup in a default ("untouched") Ubuntu installation:

```bash
# Basic requirements
sudo apt-get update
sudo apt-get install git python3-venv

git clone https://github.com/flaudisio/ansible-workstation.git ~/.local/share/ansible-workstation

cd ~/.local/share/ansible-workstation

make install
eval $( make venv-activate )

ansible --version
```

## Usage

Run the `complete` playbook:

```bash
cd ~/.local/share/ansible-workstation

./run.sh playbooks/complete.yml
```

The [run.sh](run.sh) script is a simple wrapper for the `ansible-playbook` command. By default it uses the `--become --ask-become-pass`
arguments, so your user must be able to run commands using `sudo` (this is the default behavior in standard Ubuntu installations).

## Running specific tasks

Use `ansible-playbook` arguments for advanced actions like running specific tasks, enabling check mode and showing diffs.

Example:

```bash
./run.sh playbooks/complete.yml --list-tasks
./run.sh playbooks/complete.yml --tags backup,spotify
./run.sh playbooks/complete.yml -t package:misc -t restic
./run.sh playbooks/complete.yml -t spotify --diff -C
```

## License

[WTFPL](LICENSE).
