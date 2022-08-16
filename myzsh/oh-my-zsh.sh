# Initializes Oh My Zsh

# Load all stock functions (from $fpath files) called below.
autoload -U compaudit compinit
# Save the location of the current completion dump file.
if [[ -z "$ZSH_COMPDUMP" ]]; then
  ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump-${ZSH_VERSION}"
fi
compinit -u -d "$ZSH_COMPDUMP"

unset zcompdump_revision zcompdump_fpath zcompdump_refresh

# Load all of the config files in ~/oh-my-zsh that end in .zsh
# TIP: Add files you don't want in git to .gitignore
for config_file ("$ZSH"/lib/*.zsh); do
  source "$config_file"
done

# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
  if [[ -f "$ZSH/plugins/$plugin/$plugin.plugin.zsh" ]]; then
    source "$ZSH/plugins/$plugin/$plugin.plugin.zsh"
  fi
done
unset plugin


