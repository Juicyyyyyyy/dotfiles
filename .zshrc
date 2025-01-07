# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Using Powerlevel10k for a modern and customizable prompt.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt. Should stay close to the top of the file.
# Initialization code that may require console input (password prompts, [y/n] confirmations, etc.) must go above this block.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# List of plugins to load
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  autojump
  docker
  kubectl
  colored-man-pages
  extract
  alias-finder
  history
  history-substring-search
)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Enable syntax highlighting (requires zsh-syntax-highlighting plugin)
# source ${(q-)PWD}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable autosuggestions (requires zsh-autosuggestions plugin)
# source ${(q-)PWD}/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set up Powerlevel10k configuration
# If you haven't configured it yet, run `p10k configure` after installing Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Language environment
export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# Aliases
alias ll="ls -la"
alias gs="git status"
alias gp="git pull"
alias ga="git add"
alias gc="git commit -m"
alias gd="git diff"
alias gl="git log --oneline --graph --decorate"
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

# Custom Path (uncomment and modify if needed)
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# History Configuration
HIST_STAMPS="yyyy-mm-dd"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt share_history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_verify
setopt extended_history

# Enable case-insensitive completion
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

# Auto-update settings
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# Disable magic functions if pasting URLs/text is problematic
# DISABLE_MAGIC_FUNCTIONS="true"

# Disable colors in `ls` (optional)
# DISABLE_LS_COLORS="true"

# Disable auto-setting terminal title (optional)
# DISABLE_AUTO_TITLE="true"

# Enable command auto-correction
ENABLE_CORRECTION="true"

# Display red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files as dirty in VCS
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Custom folder for Oh My Zsh (optional)
# ZSH_CUSTOM=/path/to/new-custom-folder

# Powerlevel10k Settings (optional customization)
# You can customize the prompt by editing ~/.p10k.zsh or running `p10k configure`

# Enable autojump
[[ -s /usr/share/autojump/autojump.zsh ]] && source /usr/share/autojump/autojump.zsh

# Load any additional custom scripts
for config_file ($ZSH/custom/*.zsh(N)) source $config_file
export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"
export PATH="$PATH:/usr/lib/postgresql/17/bin/"

