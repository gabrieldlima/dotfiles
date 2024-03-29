WORDCHARS='*?_-.[]~=\&;!#%^(){}<>|'

# ZSH OPTIONS
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt COMPLETE_ALIASES

# PROMPT
eval "$(starship init zsh)"

# AUTOCOMPLETE
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist

# BINDKEYS
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# ALIASES
alias ls='exa --long --group-directories-first --icons'
alias ll='exa --long --group-directories-first --icons'
alias la='exa --long --all --group-directories-first --icons'
alias lt='exa --long --tree --group-directories-first --icons'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -p'
alias rmdir='rmdir -p'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias tree='tree -C'
alias ip='ip -color'
alias cat='bat'
alias vi='nvim'
alias vim='nvim'
alias df="duf"
alias lf='lfub'
alias dot='/usr/bin/git --git-dir=$HOME/.local/share/dotfiles/ --work-tree=$HOME'
alias token='cat $HOME/.config/token | xclip -selection clipboard'
alias history='history 1'

# FZF
source $HOME/.config/zsh/fzf/completion.zsh
source $HOME/.config/zsh/fzf/key-bindings.zsh

# PLUGINS
source $HOME/.config/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
