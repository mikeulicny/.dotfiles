# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mike/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/mike/.fzf/bin"
fi



# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/mike/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/mike/.fzf/shell/key-bindings.zsh"
