use std
use std/log


# Extract Firefox history stats
def "xtk firefox history" [] {
    open ~/.mozilla/firefox/*.default/places.sqlite | get moz_places | select url visit_count last_visit_date | sort-by -r visit_count
}

# Extract Firefox open tabs
# def  firefox-tabs [] {


# Alias
source $"/home/beto/.config/nushell/aliases.nu"

def 2d6 [] {
    random dice -d 2 | math sum
}

# list user's processes
def myps [] {
    ps -l | where user_id == (id -u $env.USER | into int)
}

# Benchmark dd's bs
# def ddbs [] {
#     let size = 1073741824  # Total bytes to write (1GB)
#     for bs in [4K, 8K, 16K, 32K, 64K, 128K, 256K, 512K, 1M, 2M, 4M, 8M, 16M, 32M, 64M, 128M, 256M, 512M, 1G] {
#         let count = (($size | into filesize) // ($"($bs)B" | into filesize))
#         let result = (timeit {dd if=/dev/random of=/dev/null bs=$'($bs)' count=$'($count)' o+e> /dev/null})
#         print $'BlockSize: ($bs), Time: ($result)'
#     }
# }

# Test different block sizes for throughput:
# ddbs if=/dev/zero of=/dev/null --size 1073741824
def "xtk ddbs" [
    if:string
    of:string = "/dev/null"
    --size $size:int = 1073741824  # Total bytes to write (1GB)
    # 100 MB
    # --size $size:int = 104857600
] {
    for bs in [4K, 8K, 16K, 32K, 64K, 128K, 256K, 512K, 1M, 2M, 4M, 8M, 16M, 32M, 64M, 128M, 256M, 512M, 1G] {
        # print $"Processing block size: ($bs) for ($size) bytes from ($if) to ($of)"
        let count = (($size | into filesize) // ($"($bs)B" | into filesize))
        let result = (timeit {dd if=$"($if)" of=$"($of)" bs=$'($bs)' count=$'($count)' o+e> /dev/null}) #  o+e> /dev/null
        print $'BlockSize: ($bs), Time: ($result)'
        echo { BlockSize: $bs, Time: $result }
    }
}

# Add ssh-agent to the environment
^ssh-agent -c
    | lines
    | first 2
    | parse "setenv {name} {value};"
    | transpose -r
    | into record
    | load-env

ssh-add ~/.ssh/jupiter o+e> (std null-device)

source $"/home/beto/.config/nushell/login.nu"

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
