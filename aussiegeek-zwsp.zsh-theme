# This theme is copy of aussiegeek with zero width space at the end of the prompt used for tmux jumping
ZWSP=" "
PROMPT='$fg_bold[blue][ $fg[red]%t $fg_bold[blue]] $fg_bold[blue] [ $fg[red]%n@%m:%~$(git_prompt_info)$fg_bold[blue] ]$reset_color$ZWSP
$ '
# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[green]("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_CLEAN="✔"
ZSH_THEME_GIT_PROMPT_DIRTY="✗"
