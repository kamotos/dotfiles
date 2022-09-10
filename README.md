requirements : 

Before running the steps below please make to have an SSH key in Github associated with the machine from which the following commands are being ran.

```shell
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply kamotos
```
