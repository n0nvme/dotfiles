# n0nvme's dotfiles

dots are managed using [chezmoi](https://www.chezmoi.io/).

## Configured software
- zsh
- neovim
- zellij
- yazi
- kitty
- waybar
- hyprland & hyprlock

## Known hyprland issues
- [Cursor no longer hides on touch](https://github.com/hyprwm/Hyprland/issues/6724)

## Scripts
### fetch-kubectx
pull k3s kubeconfig using ssh and add to local kubeconfig

#### Requirements
- [yq](https://github.com/mikefarah/yq)
- [kubecm](https://github.com/sunny0826/kubecm)
