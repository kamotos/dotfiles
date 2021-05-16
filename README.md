requirements : 

```shell
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply kamotos
```
