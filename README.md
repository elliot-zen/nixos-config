# My nixos-config
## Home-manager
```sh
# for nixos (linux-x86_64)
home-manager build --flake .#nixos
# for darwin
home-manager build --flake .#darwin
```

## Use with macos

### Update system
```
darwin-rebuild switch --flake .
# show help
darwin-help
```

## Use with nixos
## Volume
```sh
wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%-
wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%+
wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

# Change source/slink
wpctl status 
wpctl set-default ID
```

## GC
```sh 
sudo nix-collect-garbage -d
```

