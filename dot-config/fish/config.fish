if status is-interactive
  set -g fish_greeting

  # Prompt
  starship init fish | source

  # Atuin (better shell history)
  atuin init fish | source

  # Theme
  fish_config theme choose CatppuccinMocha
end
