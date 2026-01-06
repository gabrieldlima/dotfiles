$env.PROMPT_COMMAND_RIGHT = ""
$env.config.buffer_editor = "nvim"
$env.config.edit_mode = "emacs"
$env.config.show_banner = false
$env.config.table.mode = "single"
$env.config.history.max_size = 50000

alias cat = bat

# starthip prompt
# mkdir ($nu.data-dir | path join "vendor/autoload")
# starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

source ~/.zoxide.nu
