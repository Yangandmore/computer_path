# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"
# Fig pre block. Keep at the top of this file.
# # If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/yangshiqu/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="awesomepanda"
ZSH_THEME="xxf"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
	# alias快捷键 https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
	# g=git
	# ga、gaa
	# gb、gba
	# gcmsg=git commit -m
	# gd=git diff
	# ggl=git pull origin
	# ggp=git push origin
	# gst=git status
	git
	# 解压工具 x
	extract
	# 提供进度条粘贴 cpv
	cp
	# 跳转
	z
	# 提供刷新zshrc文本、键入src即可
	zsh_reload
	# 提供cd辅助功能
	# zsh-interactive-cd
  # 自动补全提示
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
	history-substring-search
  vi-mode
  themes
)

source $ZSH/oh-my-zsh.sh

# 命令行提示颜色
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#636464,bold,underline"

# 历史记录切换
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# 添加fzf预览效果
# alias fzf='fzf --preview '"'"'[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'"'"
alias fzf='fzf --preview '"'"'[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'"'"

# Python版本这里控制
alias python3='/usr/local/Cellar/python@3.7/3.7.13/Frameworks/Python.framework/Versions/3.7/bin/python3.7'

# 新vim路径
# alias vim='/usr/local/Cellar/vim/8.2.2650/bin/vim'
# alias v5='/Users/yangshiqu/Downloads/nvim-osx64/bin/nvim'
alias v='/usr/local/Cellar/neovim/0.7.0/bin/nvim'
alias vd='nvim -d'

# brew services
alias bs='brew services'

# rm 修改
alias rm="trash -F"

# ps进程查询修改
alias ps="ps -ef|grep"

# evosuite-1.0.6
alias evosuite="java -jar ~/Library/evosuite-1.0.6/evosuite-1.0.6.jar -projectCP $PWD/target/classes"

# --------  cp  --------
alias cp='cpv --progress'

alias j='z'

# ranger 文件管理
alias f='ranger'

source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.bash_profile

# Fig post block. Keep at the bottom of this file.
# # 打开命令行后显示电脑信息
pfetch

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zshrc.post.zsh"
