# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mike/.zshrc'

# End of lines added by compinstall
PROMPT=$'[%n@%M] %F{blue}\U03bb%F{reset} '
RPROMPT='%~ %t'

# fzf autocomplete settings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# use ripgrep by default for faster searching
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--reverse --height 40% --border --preview "cat {}"' 

# allow user-wide installations for npm
PATH="$HOME/node_modules/bin:$PATH"
export npm_config_prefix=~/node_modules

# kill process
fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}
