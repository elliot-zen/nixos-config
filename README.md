# My nixos-config
## Home-manager
```sh
nix run home-manager/master -- init --switch
```

## Rebuil with Proxy
```sh
shell
```

## Volume
```sh
wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%-
wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%+
wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
```
