# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# Default editor
export BROWSER="qutebrowser"
export EDITOR="nvim"

# Bash
export HISTSIZE=-1

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# X11
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export XAUTHORITY="$XDG_CONFIG_HOME/x11/xauthority"

# Less
export LESSHISTFILE="$XDG_STATE_HOME/lesshst"

# Pulseaudio
export PULSE_COOKIE="$XDG_CONFIG_HOME/pulse/cookie"
