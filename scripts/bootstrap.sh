#!/bin/sh

die()
{
    [ -n "$1" ] && echo "$*"
    exit 1
}

echo "Verificando Ansible"

ansible --version || die "Fatal: erro ao executar o Ansible. Verifique seu ambiente."

echo
echo "Instalando roles externas"

ansible-galaxy install --force -r requirements.yml -p roles/ \
    || die "Fatal: erro ao instalar roles externas."

echo
echo "Feito! :-)"
