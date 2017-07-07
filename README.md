# Ansible: Workstation

Playbook e roles do Ansible que utilizo para provisionar minhas workstations.

O projeto ainda está no começo e não provisiona 100% do meu ambiente. Atualizações
regulares deverão ocorrer nas próximas semanas.

## Compatibilidade

As roles foram criadas para o **Ubuntu 16.04 (amd64)** – mais precisamente uma
instalação mínima via [Netboot][netboot] com _Standard system utilities_ e _xubuntu-core_.

Ainda assim, leia as tasks antes de usar; algumas são específicas para meu uso.

[netboot]: http://cdimage.ubuntu.com/netboot/xenial/

## Uso

No _primeiro uso_, certifique-se de que o Ansible e as roles externas estão instalados:

```console
$ wget -nv https://github.com/flaudisio/ansible-workstation/archive/master.tar.gz -O - | tar -xzf -
$ cd ansible-workstation/
$ ./scripts/bootstrap.sh
```

Feito isso, execute o playbook:

```console
$ ansible-playbook -bK playbook.yml -i inventory.ini
```

Observe que:

- As opções `-b` e `-K` são, respectivamente, `--become` e `--ask-become-pass`;
- O playbook provisiona a própria máquina ([`connection: local`](playbook.yml)),
  assumindo um usuário com permissão de `sudo`, como em uma típica instalação do
  Ubuntu;
- Tarefas como a instalação de "dotfiles" são executadas pelo usuário que executou
  o Ansible. Por exemplo, o `.bashrc` será instalado em `/home/usuario` em vez de
  `/root`;
- Nenhum pacote existente é atualizado (e.g. APT sempre com `state: present`).

## Roles externas

- [geerlingguy.docker](https://github.com/geerlingguy/ansible-role-docker)

## Execução de tarefas específicas

Use o poder das tags! ;-)

Exemplo: para instalar pacotes utilitários e, depois, VirtualBox e Vagrant:

```console
$ ansible-playbook playbook.yml -i inventory.ini --list-tasks
$ ansible-playbook -bK playbook.yml -i inventory.ini -t pkg:misc
$ ansible-playbook -bK playbook.yml -i inventory.ini -t vbox,vagrant
```

## Software

### i3

O [i3][i3-wm] é o gerenciador de janelas [escolhido](roles/workstation/tasks/i3.yml)
para esse projeto. Use a tag `i3` para as tarefas relacionadas.

[i3-wm]: https://i3wm.org/

### Utilitários e outros

Os seguintes programas foram escolhidos ou estão sob avaliação.

| Uso | Software(s) |
|-----|-------------|
| Emulador de terminal | xfce4-terminal
| Abertura de URLs e aplicativos via terminal | `exo-open` |
| Navegador de arquivos | Thunar |
| Lançador | `dmenu`? [`j4-dmenu-desktop`][j4]? |
| Áudio | `pavucontrol` |
| Inicialização automática de aplicativos | `exec`, `exec_always` ([docs][exec-docs]) |
| Rede | `nmcli`, `nmtui` |
| Fontes do sistema | TBD |
| Screensaver | TBD |
| Screenshooter | TBD (`xfce4-screenshooter`? `import`?) |
| Background do desktop | TBD (`feh`?) |

[j4]: https://github.com/enkore/j4-dmenu-desktop
[exec-docs]: https://i3wm.org/docs/userguide.html#exec

## TODO

- Docs e Configurações
  - [ ] Expandir tabela de programas usados
  - [ ] Configurar i3
  - [ ] Configurar `sources.list` (sem `deb-src`, etc.)
  - [ ] Configurar sudoers (`Defaults insults`)
  - [ ] Configurar ícones e fontes padrões (`lxappearance`?)
  - [ ] Configurar programas padrões

- Utilitários
  - [x] Dotfiles
  - [ ] Scripts (GH: `flaudisio/scripts`)

- Software
  - [ ] [Mattermost](https://docs.mattermost.com/install/desktop.html#ubuntu-and-debian-based-systems)
  - [ ] [Rambox](http://rambox.pro/#download)
  - [ ] [MEGAsync](https://mega.nz/sync)
  - [x] Docker
  - [x] Docker Compose
  - [ ] [ctop](https://github.com/bcicen/ctop/releases)
  - [ ] nginx
  - [ ] pip (sistema)
  - [ ] virtualenv, virtualenvwrapper
  - [ ] [rbenv](https://github.com/rbenv/rbenv#installation)
  - [ ] [jq](https://github.com/stedolan/jq/releases)
  - [ ] [doctl](https://github.com/digitalocean/doctl/releases)
  - [ ] [Terraform](https://www.terraform.io/downloads.html)

- Configurações sensíveis
  - [ ] `.ssh/config` (pessoal e do trabalho)
  - [ ] VPNs

## Licença

[WTFPL](http://www.wtfpl.net/txt/copying/).
