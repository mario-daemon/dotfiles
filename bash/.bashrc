export EDITOR='nvim'

# Install package
pac() {
    local pkgs
    pkgs=$(pacman -Ss | fzf -m | awk '{print $1}' | cut -d'/' -f2) || return 0
    [ -n "$pkgs" ] && sudo pacman -S $pkgs
}

# Search info about a package
pacs() {
    local pkgs
    pkgs=$(pacman -Ss | fzf -m | awk '{print $1}' | cut -d'/' -f2) || return 0
    [ -n "$pkgs" ] && pacman -Si $pkgs
}

# Remove package
pacrm() {
    local pkgs
    pkgs=$(pacman -Qq | fzf -m) || return 0
    [ -n "$pkgs" ] && sudo pacman -Rns $pkgs
}

# Get info about installed package
pacq() {
    local pkgs
    pkgs=$(pacman -Qq | fzf -m) || return 0
    [ -n "$pkgs" ] && pacman -Qikk $pkgs
}

# Get info about explicitly installed package
pacqe() {
    local pkgs
    pkgs=$(pacman -Qqe | fzf -m) || return 0
    [ -n "$pkgs" ] && pacman -Qikk $pkgs
}

alias ls='ls --color=auto'
alias ll='ls -lh --show-directories-first --color=auto' # long list
alias la='ls -alh --show-directories-first --color=auto' # hidden
alias grep='grep --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias ff='clear && fastfetch'
alias cmatrix='cmatrix -C blue'
alias vi='nvim'
alias vim='nvim'

umask 027
