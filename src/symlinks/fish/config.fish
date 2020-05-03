# Colored Man
# Solarized Light & Magenta highlight
set -g man_blink -o red
set -g man_bold -o magenta
set -g man_standout -b white 586e75
set -g man_underline -u 586e75

# Fisher
set -g fisher_path $HOME/.fisher

set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_functions $fish_functions[1] $fisher_path/functions $fish_functions[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]
set fish_completions $fish_completions[1] $fisher_path/completions $fish_completions[2..-1]

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2> /dev/null
end
