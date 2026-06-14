## Notes
- Add `git` and `nix.settings.experimental-features = [ "nix-command" "flakes" ];` to `/etc/nixos/configuration.nix`
- `sudo nixos-rebuild switch`
- `git clone https://github.com/bschan9228/dotfiles ~/.dotfiles`
- `cp /etc/nixos/hardware-configuration.nix ~/.dotfiles/hardware-configuration.nix`
- `sudo nixos-rebuild switch --flake .`
