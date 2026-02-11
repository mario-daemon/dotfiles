unalias -a 2>/dev/null # breaks stuff like zsh-z

alias z='zshz 2>&1'

alias ls='ls --color=auto'
alias ll='ls -lh --group-directories-first --color=auto' # long list
alias la='ls -alh --group-directories-first --color=auto' # hidden
alias grep='grep --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias ff='clear && fastfetch'
alias cmatrix='cmatrix -C blue'
alias vi='nvim'
alias vim='nvim'
alias chmod='chmod --preserve-root'
