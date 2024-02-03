# Readme
It's a shell script that passes your bash aliases and programs from your $PATH to dmenu. 

I know about dmenu-recent-aliases. 1) It breaks my dmenu and 2) I don't need history for my dmenu. So I like my script more.

## Features
* The default aliases file is `.bashrc`. But you can declare `your aliases file` for dmenu_alss. To do so, pass just one argument - path to your file. It can be relative/absolute. For example:
```bash
$ bash dmenu_alss ~/.bash_aliases
```
* dmenu_alss uses `~/.cache/dmenu_run` file to execute files from $PATH. To reload `~/.cache/dmenu_run` execute the ordinary `dmenu_run`.
* Run dmenu_alss from Linux command line (and from dmenu `•o•` ):
```bash
$ cp dmenu_alss /usr/local/bin
```

## Obvious requirements
* dmenu
* bash. Script hasn't been tested on other shells.
