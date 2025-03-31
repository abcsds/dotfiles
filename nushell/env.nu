# env.nu

$env.config.show_banner = false
$env.config.buffer_editor = "nvim"
$env.config.table.mode = "rounded"
# Theme
$env.LS_COLORS = (vivid generate snazzy)

# Environment variables?
$env.OS = $"(open --raw /etc/os-release | lines | where $it =~ '^NAME=' | str replace 'NAME=' '')"
$env.USER = $"(whoami)"
$env.HOME = $"/home/($env.USER)"
$env.DOTFILES_ROOT = $"($env.HOME)/.dotfiles"
$env.PROJECTS_ROOT = $"($env.HOME)/code"
$env.EDITOR = "nvim"
$env.VISUAL = "code"
$env.PATH = ($env.PATH | prepend $'($env.DOTFILES_ROOT)/bin')
$env.PATH = ($env.PATH | append $'($env.HOME)/.local/bin')
# TODO: Console or terminal?
# case $(tty) in
#   (/dev/tty[1-9]) export CONSOLE='virtual';;
#               (*) export CONSOLE='terminal';;
# esac

# Locale
$env.LC_TIME = "en_US.UTF-8"
$env.LC_MONETARY = "de_AT.UTF-8"
$env.LC_NUMERIC = "de_AT.UTF-8"
$env.LC_PAPER = "de_AT.UTF-8"
$env.LC_TELEPHONE = "de_AT.UTF-8"
$env.LC_NAME = "de_AT.UTF-8"
$env.LC_ADDRESS = "de_AT.UTF-8"
$env.LC_IDENTIFICATION = "de_AT.UTF-8"
$env.LC_MEASUREMENT = "de_AT.UTF-8" 
$env.LC_MESSAGES = "en_US.UTF-8"
$env.LC_COLLATE = "en_US.UTF-8"
$env.LC_CTYPE = "en_US.UTF-8"
$env.LC_ALL = "en_US.UTF-8"

# Xkb settings
$env.XKB_DEFAULT_LAYOUT = "us"
$env.XKB_DEFAULT_VARIANT = "dvorak-alt-intl"
$env.XKB_DEFAULT_MODEL = "pc101"

# HF TODO
$env.HF_DATASETS_CACHE = "/home/beto/Everything/data/HF/"

# Load Starship
$env.STARSHIP_CONFIG = $"/home/beto/.config/starship/starship.toml"
$env.STARSHIP_CACHE = $"/home/beto/.starship/cache"
mkdir ($nu.data-dir | path join "vendor/autoload")
^starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# If OS is not NixOS
if $env.OS != "NixOS" {

    # Load atuin
    # source ~/.local/share/atuin/init.nu

    # Carapace
    # ~/.config/nushell/env.nu
    $env.CARAPACE_BRIDGES = 'zsh,bash' # Optional
    mkdir ~/.cache/carapace
    ^carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
}


#~/.config/nushell/config.nu
source ~/.cache/carapace/init.nu
