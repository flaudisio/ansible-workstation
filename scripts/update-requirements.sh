#!/bin/sh

set -ex

ansible-galaxy install --force -r requirements.yml -p roles_galaxy/
