use std
use std/log

# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.
$env.config.show_banner = false
$env.config.buffer_editor = "nvim"
$env.config.table.mode = "rounded"

# Environment variables?
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

# # Make sure abcsds/dotfiles are a git repo cloned on /home/beto/.dotfiles
# if (ls /home/beto/.dotfiles/.git | is-not-empty) {
#     git pull /home/beto/.dotfiles
# } else {
#     try {
#         git clone git@github.com:abcsds/.dotfiles /home/beto/.dotfiles
#     } catch {
#         print $"Dotfile clone failed, Credentials?"
#     }
# }

# Extract Firefox history stats
def firefox-history [] {
    open ~/.mozilla/firefox/*.default/places.sqlite | get moz_places | select url visit_count last_visit_date | sort-by -r visit_count
}

# Extract Firefox open tabs
# def  firefox-tabs [] {

# }

# Theme
$env.LS_COLORS = (vivid generate snazzy)

# Prompt

# Alias
alias ll = ls -laf
alias opn = xdg-open
alias cat = bat
alias top = htop

alias mv = mv -iv # Confirm, verbose
alias cp = cp -iv # Confirm before overwriting
alias rm = rm -t # Use trash

alias _ = sudo
alias c = clear
alias k = clear
alias cls = clear
alias q = exit

# If broot tree = broot
# else
# alias tree = ls  ./**/* | get name | each { str replace -ar '[^/]*/' '|____' } | to text

alias py = python
alias pipdate = pip list --outdated | from ssv | select Package | each { pip install -U $it.Package }
alias activate = sh -i -c 'source .venv/bin/activate ; nu'
# Alternative:
# $env.PATH = ($env.PATH | split row (char esep)
#   | prepend './venv/bin'

alias jl = julia
alias jlup = julia --project=. -e "import Pkg; Pkg.update()"
alias jlinstall = julia --project=. -e "import Pkg; Pkg.instantiate()"
alias pluto = julia --project=. -e "import Pkg; Pkg.add(\"Pluto\"); import Pluto; Pluto.run()"

def 2d6 [] {
    random dice -d 2 | math sum
}

# install nix profile to work with nu
def nix-comfyshell [] {
    nix profile install 'nixpkgs#nushell'
    nix profile install 'nixpkgs#starship'
    nix profile install 'nixpkgs#carapace'
    nix profile install 'nixpkgs#atuin'
    nix profile install 'nixpkgs#broot'
    nix profile install 'nixpkgs#btop'
    nix profile install 'nixpkgs#fzf'
    nix profile install 'nixpkgs#ranger'
    nix profile install 'nixpkgs#starship'
    nix profile install 'nixpkgs#vivid'
    nix profile install 'nixpkgs#zoxide'
}

# list user's processes
def myps [] {
    ps -l | where user_id == (id -u $env.USER | into int)
}

# Benchmark dd's bs
# def ddbs [] {
#     let total = 1073741824  # Total bytes to write (1GB)
#     for bs in [4K, 8K, 16K, 32K, 64K, 128K, 256K, 512K, 1M, 2M, 4M, 8M, 16M, 32M, 64M, 128M, 256M, 512M, 1G] {
#         let count = (($total | into filesize) // ($"($bs)B" | into filesize))
#         let result = (timeit {dd if=/dev/random of=/dev/null bs=$'($bs)' count=$'($count)' o+e> /dev/null})
#         print $'BlockSize: ($bs), Time: ($result)'
#     }
# }

# Test different block sizes for throughput:
# ddbs if=/dev/zero of=/dev/null --total 1073741824
def ddbs [
    if:string
    of:string = "/dev/null"
    --total $total:int = 1073741824  # Total bytes to write (1GB)
    # 100 MB
    # --total $total:int = 104857600
] {
    for bs in [4K, 8K, 16K, 32K, 64K, 128K, 256K, 512K, 1M, 2M, 4M, 8M, 16M, 32M, 64M, 128M, 256M, 512M, 1G] {
        # print $"Processing block size: ($bs) for ($total) bytes from ($if) to ($of)"
        let count = (($total | into filesize) // ($"($bs)B" | into filesize))
        let result = (timeit {dd if=$"($if)" of=$"($of)" bs=$'($bs)' count=$'($count)' o+e> /dev/null}) #  o+e> /dev/null
        print $'BlockSize: ($bs), Time: ($result)'
        echo { BlockSize: $bs, Time: $result }
    }
}

alias serve = python -m http.server
alias openPorts = sudo lsof -i -P -n | from ssv | find LISTEN
alias openTCP = sudo lsof -i -P -n | from ssv | find TCP
alias openUDP = sudo lsof -i -P -n | from ssv | find UDP
alias sshHosts = open ~/.ssh/config | lines | find -r "^Host" | replace "Host " "" 

# Git
alias g = git
alias glog = git log --graph --pretty=oneline --abbrev-commit --date=relative
alias gp = git push origin HEAD
alias gpp = git pull --rebase
alias gd = git diff
alias gco = git checkout
alias gcm = git commit -m
alias gca = git commit --amend
alias gcl = git clone
alias gb = git branch
alias gs = git status -sb
alias ghist = git shortlog -sn
def gexport [name] {
    git archive --format zip --output $name.zip HEAD
}

alias panmd = pandoc --from markdown --template eisvogel --listings

# Tmux
alias txl = tmux ls
alias txn = tmux new -s
alias txk = tmux kill-session -t
alias txa = tmux attach -t

# Zellij
alias zj = zellij
alias zl = zellij list
alias zk = zellij kill
alias za = zellij attach

# LaTeX
# alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

# Xkb settings
$env.XKB_DEFAULT_LAYOUT = "us"
$env.XKB_DEFAULT_VARIANT = "dvorak-alt-intl"
$env.XKB_DEFAULT_MODEL = "pc101"

# HF TODO
$env.HF_DATASETS_CACHE = "/home/beto/Everything/data/HF/"

# Load Atuin # TODO absolute path
source $"/home/beto/.dotfiles/atuin/init.nu"

# Carapace
## ~/.config/nushell/env.nu
$env.CARAPACE_BRIDGES = 'zsh,bash' # Optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

#~/.config/nushell/config.nu
source ~/.cache/carapace/init.nu

# Load Starship # TODO: absolute path
$env.STARSHIP_CONFIG = $"/home/beto/.dotfiles/starship/starship.toml"
$env.STARSHIP_CACHE = $"/home/beto/.starship/cache"
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Add ssh-agent to the environment
^ssh-agent -c
    | lines
    | first 2
    | parse "setenv {name} {value};"
    | transpose -r
    | into record
    | load-env

ssh-add ~/.ssh/jupiter o+e> (std null-device)

fastfetch

# # External completer example
# # let carapace_completer = {|spans|
# #     carapace $spans.0 nushell $spans | from json
# # }


# # The default config record. This is where much of your global configuration is setup.
# let-env config = {
#   ls: {
#     use_ls_colors: true # use the LS_COLORS environment variable to colorize output
#     clickable_links: true # enable or disable clickable links. Your terminal has to support links.
#   }
#   rm: {
#     always_trash: false # always act as if -t was given. Can be overridden with -p
#   }
#   cd: {
#     abbreviations: false # allows `cd s/o/f` to expand to `cd some/other/folder`
#   }
#   table: {
#     mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
#     index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
#     show_empty: true # show 'empty list' and 'empty record' placeholders for command output
#     trim: {
#       methodology: wrapping # wrapping or truncating
#       wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
#       truncating_suffix: "..." # A suffix used by the 'truncating' methodology
#     }
#   }

#   explore: {
#     help_banner: true
#     exit_esc: true

#     command_bar_text: '#C4C9C6'
#     # command_bar: {fg: '#C4C9C6' bg: '#223311' }

#     status_bar_background: {fg: '#1D1F21' bg: '#C4C9C6' }
#     # status_bar_text: {fg: '#C4C9C6' bg: '#223311' }

#     highlight: {bg: 'yellow' fg: 'black' }

#     status: {
#       # warn: {bg: 'yellow', fg: 'blue'}
#       # error: {bg: 'yellow', fg: 'blue'}
#       # info: {bg: 'yellow', fg: 'blue'}
#     }

#     try: {
#       # border_color: 'red'
#       # highlighted_color: 'blue'

#       # reactive: false
#     }

#     table: {
#       split_line: '#404040'

#       cursor: true

#       line_index: true
#       line_shift: true
#       line_head_top: true
#       line_head_bottom: true

#       show_head: true
#       show_index: true

#       # selected_cell: {fg: 'white', bg: '#777777'}
#       # selected_row: {fg: 'yellow', bg: '#C1C2A3'}
#       # selected_column: blue

#       # padding_column_right: 2
#       # padding_column_left: 2

#       # padding_index_left: 2
#       # padding_index_right: 1
#     }

#     config: {
#       cursor_color: {bg: 'yellow' fg: 'black' }

#       # border_color: white
#       # list_color: green
#     }
#   }

#   history: {
#     max_size: 10000 # Session has to be reloaded for this to take effect
#     sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
#     file_format: "plaintext" # "sqlite" or "plaintext"
#   }
#   completions: {
#     case_sensitive: false # set to true to enable case-sensitive completions
#     quick: true  # set this to false to prevent auto-selecting completions when only one remains
#     partial: true  # set this to false to prevent partial filling of the prompt
#     algorithm: "prefix"  # prefix or fuzzy
#     external: {
#       enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up my be very slow
#       max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
#       completer: null # check 'carapace_completer' above as an example
#     }
#   }
#   filesize: {
#     metric: true # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
#     format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, zb, zib, auto
#   }
#   cursor_shape: {
#     emacs: line # block, underscore, line (line is the default)
#     vi_insert: block # block, underscore, line (block is the default)
#     vi_normal: underscore # block, underscore, line  (underscore is the default)
#   }
#   color_config: $dark_theme   # if you want a light theme, replace `$dark_theme` to `$light_theme`
#   use_grid_icons: true
#   footer_mode: "25" # always, never, number_of_rows, auto
#   float_precision: 2 # the precision for displaying floats in tables
#   # buffer_editor: "emacs" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
#   use_ansi_coloring: true
#   edit_mode: emacs # emacs, vi
#   shell_integration: true # enables terminal markers and a workaround to arrow keys stop working issue
#   # true or false to enable or disable the welcome banner at startup
#   show_banner: true
#   render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.

#   hooks: {
#     pre_prompt: [{||
#       null  # replace with source code to run before the prompt is shown
#     }]
#     pre_execution: [{||
#       null  # replace with source code to run before the repl input is run
#     }]
#     env_change: {
#       PWD: [{|before, after|
#         null  # replace with source code to run if the PWD environment is different since the last repl input
#       }]
#     }
#     display_output: {||
#       if (term size).columns >= 100 { table -e } else { table }
#     }
#   }
#   menus: [
#       # Configuration for default nushell menus
#       # Note the lack of source parameter
#       {
#         name: completion_menu
#         only_buffer_difference: false
#         marker: "| "
#         type: {
#             layout: columnar
#             columns: 4
#             col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
#             col_padding: 2
#         }
#         style: {
#             text: green
#             selected_text: green_reverse
#             description_text: yellow
#         }
#       }
#       {
#         name: history_menu
#         only_buffer_difference: true
#         marker: "? "
#         type: {
#             layout: list
#             page_size: 10
#         }
#         style: {
#             text: green
#             selected_text: green_reverse
#             description_text: yellow
#         }
#       }
#       {
#         name: help_menu
#         only_buffer_difference: true
#         marker: "? "
#         type: {
#             layout: description
#             columns: 4
#             col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
#             col_padding: 2
#             selection_rows: 4
#             description_rows: 10
#         }
#         style: {
#             text: green
#             selected_text: green_reverse
#             description_text: yellow
#         }
#       }
#       # Example of extra menus created using a nushell source
#       # Use the source field to create a list of records that populates
#       # the menu
#       {
#         name: commands_menu
#         only_buffer_difference: false
#         marker: "# "
#         type: {
#             layout: columnar
#             columns: 4
#             col_width: 20
#             col_padding: 2
#         }
#         style: {
#             text: green
#             selected_text: green_reverse
#             description_text: yellow
#         }
#         source: { |buffer, position|
#             $nu.scope.commands
#             | where name =~ $buffer
#             | each { |it| {value: $it.name description: $it.usage} }
#         }
#       }
#       {
#         name: vars_menu
#         only_buffer_difference: true
#         marker: "# "
#         type: {
#             layout: list
#             page_size: 10
#         }
#         style: {
#             text: green
#             selected_text: green_reverse
#             description_text: yellow
#         }
#         source: { |buffer, position|
#             $nu.scope.vars
#             | where name =~ $buffer
#             | sort-by name
#             | each { |it| {value: $it.name description: $it.type} }
#         }
#       }
#       {
#         name: commands_with_description
#         only_buffer_difference: true
#         marker: "# "
#         type: {
#             layout: description
#             columns: 4
#             col_width: 20
#             col_padding: 2
#             selection_rows: 4
#             description_rows: 10
#         }
#         style: {
#             text: green
#             selected_text: green_reverse
#             description_text: yellow
#         }
#         source: { |buffer, position|
#             $nu.scope.commands
#             | where name =~ $buffer
#             | each { |it| {value: $it.name description: $it.usage} }
#         }
#       }
#   ]
#   keybindings: [
#     {
#       name: completion_menu
#       modifier: none
#       keycode: tab
#       mode: [emacs vi_normal vi_insert]
#       event: {
#         until: [
#           { send: menu name: completion_menu }
#           { edit: complete }
#         ]
#       }
#     }
#     {
#       name: completion_previous
#       modifier: shift
#       keycode: backtab
#       mode: [emacs, vi_normal, vi_insert] # Note: You can add the same keybinding to all modes by using a list
#       event: { send: menuprevious }
#     }
#     {
#       name: history_menu
#       modifier: control
#       keycode: char_r
#       mode: emacs
#       event: { send: menu name: history_menu }
#     }
#     {
#       name: next_page
#       modifier: control
#       keycode: char_x
#       mode: emacs
#       event: { send: menupagenext }
#     }
#     {
#       name: undo_or_previous_page
#       modifier: control
#       keycode: char_u
#       mode: emacs
#       event: {
#         until: [
#           { send: menupageprevious }
#           { edit: undo }
#         ]
#        }
#     }
#     {
#       name: yank
#       modifier: control
#       keycode: char_y
#       mode: emacs
#       event: {
#         until: [
#           {edit: pastecutbufferafter}
#         ]
#       }
#     }
#     {
#       name: unix-line-discard
#       modifier: control
#       keycode: char_z
#       mode: [emacs, vi_normal, vi_insert]
#       event: {
#         until: [
#           {edit: cutfromlinestart}
#         ]
#       }
#     }
#     {
#       name: kill-line
#       modifier: control
#       keycode: char_k
#       mode: [emacs, vi_normal, vi_insert]
#       event: {
#         until: [
#           {edit: cuttolineend}
#         ]
#       }
#     }
#     # Keybindings used to trigger the user defined menus
#     {
#       name: commands_menu
#       modifier: control
#       keycode: char_t
#       mode: [emacs, vi_normal, vi_insert]
#       event: { send: menu name: commands_menu }
#     }
#     {
#       name: vars_menu
#       modifier: alt
#       keycode: char_o
#       mode: [emacs, vi_normal, vi_insert]
#       event: { send: menu name: vars_menu }
#     }
#     {
#       name: commands_with_description
#       modifier: control
#       keycode: char_s
#       mode: [emacs, vi_normal, vi_insert]
#       event: { send: menu name: commands_with_description }
#     }
#   ]
# }

# source '~/src/devenv/nushell/init.nu'
