set -g fisher_path $HOME/.fisher

set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_functions $fish_functions[1] $fisher_path/functions $fish_functions[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]
set fish_completions $fish_completions[1] $fisher_path/completions $fish_completions[2..-1]

# if not functions -q fisher
#     set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
#     curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
#     fish -c fisher
# end

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2> /dev/null
end
