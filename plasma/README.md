# Backing up plasma

```shell
tar -cvJf plasma-bkp-`date +%Y-%m-%d--%H-%M`.tar.xz ~/.config/plasma*
```

## Restoring
Stop plasma: `kquitapp plasmashell`

Restore backed up files
```shell
tar -xvf plasma-bkp-2022-04-21--10-37.tar.xz
tar -xvkf plasma-bkp-2022-04-21--10-37.tar.xz
```

Restart plasma: `plasmashell`


reset all kde
```
rm -rf .kde/
rm -f .kderc
rm -rf .config/*plasma*
rm -rf .config/*kde*
rm -rf .config/*kwin*
rm -rf .local/share/kded5
rm -rf .config/session/kwin_*
rm -rf .gtkrc-2.0*
rm -rf .cache/upstart/startkde.log*
rm -f .xsession-errors
rm -rf ~/.local/share/kscreen
```