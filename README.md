# Ansible - Workstation

Playbook do Ansible para provisionar meu computador.

## Uso

```console
$ ansible-playbook playbook.yml -i inventory.ini -b -K
```

**Nota:** `-b` e `-K` são, respectivamente, `--become` e `--ask-become-pass`.

## Pré-requisitos

Esse projeto foi designado para um Ubuntu 16.04 LTS amd64 recém-instalado via
[minimal CD](minimal-cd), no modo "expert install" e com as coleções:

  - Standard system utilities
  - Xubuntu minimal installation (`xubuntu-core`)

Entretanto deve rodar sem problemas em qualquer Ubuntu 16.04 _64 bits_.

[minimal-cd]: http://cdimage.ubuntu.com/netboot/xenial/

## i3

O [i3][i3-wm] é o gerenciador de janelas [escolhido](roles/base/tasks/i3.yml)
como principal para esse projeto.

[i3-wm]: https://i3wm.org/

### Configuração e administração do sistema

Certificar a instalação e configuração de soluções para:

- [ ] Emulador de terminal
- [ ] Abrir arquivos pelo terminal: `exo-open`? Comando embutido do i3?
- [ ] Navegador de arquivos: Thunar?
- [ ] Lançador: `dmenu` (padrão)?
- [ ] Áudio: `pavucontrol`?
- [ ] Inicialização de aplicativos ao iniciar (`exec`, `exec_always`)
- [ ] Fontes do sistema
- [ ] Screensaver
- [ ] Screenshooter: `xfce4-screenshooter`, `import`...?
- [ ] Background (desktop)
- [ ] Rede

## TODO

- [ ] Configurar `sources.list`
- [ ] Melhorar documentação (especialmente de ferramentas padrões)
- [ ] Configurações de UI (aka `tasks/ui.yml`)
  - [ ] DMZ-black (alternatives)
- [ ] Dotfiles
- [ ] Scripts (GH: `flaudisio/scripts`)
- [ ] Docker
- [ ] Docker Compose
- [ ] nginx
- [ ] VPN

## Ideias

- [ ] Suportar sistema 32 bits
