#!/bin/zsh
export ZDOTDIR=$HOME/.dotdir/zsh

# autoload colors
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

# disable beeping
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

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

zsh_add_file "plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
zsh_add_file "plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
zsh_add_file "plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"

# Key-bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# compinit
compinit

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^' edit-command-line
