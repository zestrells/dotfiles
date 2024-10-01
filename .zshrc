# Homebrew
export PATH=/opt/homebrew/bin:$PATH

# AUTOCOMPLETION

# initialize autocompletion
autoload -U compinit
compinit

# history setup
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# GENERAL

# (bonus: Disable sound errors in Zsh)
# never beep
setopt NO_BEEP

# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Minimal - Theme Settings
export MNML_INSERT_CHAR="$"
export MNML_PROMPT=(mnml_git mnml_keymap)
export MNML_RPROMPT=('mnml_cwd 20')

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="minimal"

HIST_STAMPS="dd/mm/yyyy"

ZSH_CUSTOM=$DOTFILES

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  gh
  git
  zsh-autosuggestions
  zsh-history-substring-search
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# tfswitch
export PATH="$PATH:/Users/zestrella/bin"

# GPG Config
export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
pgrep gpg-agent || gpg-agent --daemon --enable-ssh-support

# GPG
export GPG_TTY=$(tty)
function switchyubi() {
  rm -r ~/.gnupg/private-keys-v1.d
  gpgconf --kill gpg-agent
  gpg --card-status
}

export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zacharyestrella/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/zacharyestrella/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zacharyestrella/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/zacharyestrella/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# OCI
export OCI_CLI_SUPPRESS_FILE_PERMISSIONS_WARNING=True