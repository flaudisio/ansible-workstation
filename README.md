# Ansible: Workstation

Playbook e roles do Ansible que utilizo para provisionar minhas workstations.

O projeto ainda está no começo e não provisiona 100% do meu ambiente. Atualizações
regulares deverão ocorrer nas próximas semanas.

## Compatibilidade

As roles foram criadas e testadas no **Ubuntu 18.04 (amd64)**.

De qualquer forma, leia as tasks e execute com cautela para evitar problemas em seu sistema.

[netboot]: http://cdimage.ubuntu.com/netboot/xenial/

## Uso

No _primeiro uso_, certifique-se de que o Ansible e as roles externas estão instalados:

```console
$ wget -nv https://github.com/flaudisio/ansible-workstation/archive/master.tar.gz -O - | tar -xzf -
$ cd ansible-workstation-master/
$ ./scripts/bootstrap.sh
```

Feito isso, execute o playbook:

```console
$ ansible-playbook -b -K playbook.yml -i inventory.ini
```

Observe que:

- As opções `-b` e `-K` são, respectivamente, `--become` e `--ask-become-pass`;
- O playbook provisiona a própria máquina ([`connection: local`](playbook.yml)),
  assumindo um usuário com permissão de `sudo`, como em uma instalação típica do
  Ubuntu;
- Tarefas como a instalação de "dotfiles" são executadas pelo usuário que executou
  o Ansible. Por exemplo, o `.bashrc` será instalado em `/home/usuario` em vez de
  `/root`;
- Nenhum pacote existente é atualizado (e.g. APT sempre com `state: present`).

## Roles externas

- [geerlingguy.docker](https://github.com/geerlingguy/ansible-role-docker)
- [jdauphant.nginx](https://github.com/jdauphant/ansible-role-nginx)

## Execução de tarefas específicas

Use o poder das tags! ;-)

Exemplo: para instalar pacotes utilitários e, depois, VirtualBox e Vagrant:

```console
$ ansible-playbook playbook.yml -i inventory.ini --list-tasks
$ ansible-playbook -b -K playbook.yml -i inventory.ini -t pkg:misc
$ ansible-playbook -b -K playbook.yml -i inventory.ini -t vbox,vagrant
```

## TODO

- Configurações
  - [ ] Configurar `/etc/apt/sources.list` (sem `deb-src`, etc.)
  - [ ] Configurar sudoers (`Defaults insults`)

- Utilitários
  - [x] Dotfiles
  - [ ] Scripts (GitHub: `flaudisio/scripts`)

- Software
  - [ ] pip (sistema)
  - [ ] `virtualenv`, `virtualenvwrapper`
  - [ ] [rbenv](https://github.com/rbenv/rbenv#installation)
  - [ ] [nvm](https://github.com/creationix/nvm#manual-install)

- Configurações sensíveis
  - [ ] `.ssh/config` (pessoal e trabalho)
  - [ ] VPNs

## Licença

```
Copyright © 2017 Flaudísio Tolentino
This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.
```
