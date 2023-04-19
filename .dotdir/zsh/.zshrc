# export ZDOTDIR=$HOME/.dotdir/zsh
# source "$HOME/.dotdir/zsh/.zshrc"
#!/bin/sh
export ZDOTDIR=$HOME/.dotdir/zsh

autoload -U colors && colors

# If this is set, zsh sessions will append their history list to the history file, rather than replace it
setopt appendhistory

# autocd probably not supported for zsh 5.8
# Treat the `#', `~' and `^' characters as part of patterns for filename generation, etc.  (An initial unquoted `~' always produces named directory expansion.)
# If a pattern for filename generation has no matches, print an error, instead of leaving it unchanged in the argument list.  This also applies to file expansion of an initial `~' or `='.
# On an ambiguous completion, instead of listing possibilities or beeping, insert the first match immediately.  Then when completion is requested again, remove the first match and insert the second match, etc.
setopt autocd extendedglob nomatch menucomplete

# Allow comments even in interactive shells.
setopt interactive_comments

# Disable ctrl-s to freeze terminal.
stty stop undef

# disable pasted text highlighting
zle_highlight=('paste:none')

# beeping is annoying
#unsetopt BEEP


# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

zsh_add_file "plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
zsh_add_file "plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
zsh_add_file "plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"


# Plugins
# zsh_add_plugin "zsh-users/zsh-autosuggestions"
# zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
# zsh_add_plugin "hlissner/zsh-autopair"
# zsh_add_completion "esc/conda-zsh-completion" false
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

# Key-bindings

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bindkey -s '^o' 'ranger^M'
# bindkey -s '^f' 'zi^M'
# bindkey -s '^s' 'ncdu^M'
# # bindkey -s '^n' 'nvim $(fzf)^M'
# # bindkey -s '^v' 'nvim\n'
# bindkey -s '^z' 'zi^M'
# bindkey '^[[P' delete-char
# bindkey "^p" up-line-or-beginning-search # Up
# bindkey "^n" down-line-or-beginning-search # Down
# bindkey "^k" up-line-or-beginning-search # Up
# bindkey "^j" down-line-or-beginning-search # Down
# bindkey -r "^u"
# bindkey -r "^d"

# FZF 
# TODO update for mac
# [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
# [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
# [ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
# [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"
# export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
compinit

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^' edit-command-line

# Environment variables set everywhere
export EDITOR="vim"

# Autocomplete
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws
source <(kubectl completion zsh)
