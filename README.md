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
# To lower the voume
wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
# To mute/unmute the volume
wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
#  To mute/unmute microphone
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
```

