Managed with GNU stow

run GNU stow commands in this directory (must be ~/dotfiles)

Useful Parameters:
`-t <dir>` specify target directory, by default it is .. (which is why current dir should be ~/dotfiles)
`-D <pkg>` delete symlinks from a package

Deploy specific package, for instance, nvim:
```
stow nvim
```

Deploy all packages:
```
stow */
```

---

Neovim may fail to install some plugins, mainly LSP's because the specific package manager needed (for instance pip for python) may not be on the system. However it is often the case that if a language's package manager isn't on the system, an LSP for that language may not be of need anyways.


Zsh requires oh-my-zsh

curl:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
wget:
```
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
