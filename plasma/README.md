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

