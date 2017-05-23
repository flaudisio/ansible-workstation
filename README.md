# Ansible Workstation

Playbook do Ansible para provisionar meu computador.

## Uso

```console
$ ansible-playbook -bK playbook.yml -i inventory.ini
```

**Nota:** `-b` e `-K` são, respectivamente, `--become` e `--ask-become-pass`.

## Pré-requisitos

Esse projeto foi criado em um Ubuntu 16.04 LTS amd64 recém-instalado via
[minimal CD](minimal-cd), no modo "expert install" e com as coleções:

  - Standard system utilities
  - Xubuntu minimal installation (`xubuntu-core`)

Entretanto deve ser compatível com praticamente qualquer Ubuntu 16.04.

[minimal-cd]: http://cdimage.ubuntu.com/netboot/xenial/

## i3

O [i3][i3-wm] é o gerenciador de janelas [escolhido](roles/workstation/tasks/i3.yml)
para esse projeto.

[i3-wm]: https://i3wm.org/

## Software

Os seguintes programas são escolhidos nesta configuração de sistema:

- Emulador de terminal: `xfce4-terminal`
- Abertura de arquivos pelo terminal: `exo-open`
- Navegador de arquivos: `Thunar`
- Lançador: `dmenu` (padrão do i3)
- Áudio: `pavucontrol`
- Inicialização automática de aplicativos: `exec`, `exec_always` ([i3 docs][exec-docs])
- Rede: `nmcli`, `nmtui`
- Fontes do sistema: `???`
- Screensaver: `???`
- Screenshooter: `???` (`xfce4-screenshooter`? `import`?)
- Background do desktop: `???` (`feh`?)

[exec-docs]: https://i3wm.org/docs/userguide.html#exec

## TODO

- [ ] Configurar i3
- [ ] Configurar `sources.list`
- [ ] Melhorar documentação (especialmente de ferramentas padrões)
- [ ] Configurar UI
  - [ ] Ícones e fontes padrões (`lxappearance`?)
- [x] Dotfiles
- [ ] Scripts (GH: `flaudisio/scripts`)
- [ ] Docker
- [ ] Docker Compose
- [ ] nginx
- [ ] VPN
