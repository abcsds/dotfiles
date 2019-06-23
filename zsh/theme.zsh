if [[ $OS == "Darwin" ]]; then

    POWERLEVEL9K_MODE="awesome-patched"

    # Wifi on OSX
    POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
    POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="blue"
    POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="yellow"

    zsh_wifi_signal(){
        local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
        local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

        if [ "$airport" = "Off" ]; then
            local color='%F{yellow}'
            echo -n "%{$color%}Wifi Off"
        else
            local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
            local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
            local color='%F{yellow}'

            [[ $speed -gt 100 ]] && color='%F{green}'
            [[ $speed -lt 50 ]] && color='%F{red}'

            echo -n "%{$color%}$ssid $speed Mb/s%{%f%}" # removed char not in my PowerLine font
        fi
    }
elif [[ $OS == "Linux" ]]; then
  POWERLEVEL9K_MODE="Powerlevel9k"

else
  POWERLEVEL9K_MODE="compatible"
  # Maybe also clear colors for the backgrounds:
  # POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="clear"
fi

# https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
# The segments that are currently available are:
# https://github.com/bhilburn/powerlevel9k/blob/master/README.md#available-prompt-segments

# aws - The current AWS profile, if active (more info below)
# context - Your username and host (more info below)
# dir - Your current working directory.
# history - The command number for the current line.
# node_version - Show the version number of the installed Node.js.
# rbenv - Ruby environment information (if one is active).
# rspec_stats - Show a ratio of test classes vs code classes for RSpec.
# status - The return code of the previous command, and status of background jobs.
# symfony2_tests - Show a ratio of test classes vs code classes for Symfony2.
# symfony2_version - Show the current Symfony2 version, if you are in a Symfony2-Project dir.
# time - System time.
# virtualenv - Your Python VirtualEnv.
# vcs - Information about this git or hg repository (if you are in one).

# Show promt on next line
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
# POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="↳ "

# Disable right prompt
# POWERLEVEL9K_DISABLE_RPROMPT=true

# Segment separators
# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$"\uE0B1"
# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$"\uE0B3"

# Light colorscheme
# POWERLEVEL9K_COLOR_SCHEME="light"

# Segment customization
# Colors at: http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

# Colors for OS icon
POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"

# Customizing `czsh-autosuggestionontext` colors for root and non-root users
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="240"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="015"
# POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
# POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="blue"

# Customizing `dir`
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_DIR_BACKGROUND="029"
POWERLEVEL9K_DIR_FOREGROUND="000"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

# Customizing `time`
# POWERLEVEL9K_TIME_FOREGROUND="red"
# POWERLEVEL9K_TIME_BACKGROUND="blue"
# POWERLEVEL9K_TIME_FORMAT="%D{%S:%M:%H}"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='245'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='black'

# Customizing `virtualenv` colors
POWERLEVEL9K_VIRTUALENV_BACKGROUND="214"
POWERLEVEL9K_VIRTUALENV_FOREGROUND="000"
# Customizing `rbenv` colors
POWERLEVEL9K_RBENV_BACKGROUND="214"
POWERLEVEL9K_RBENV_FOREGROUND="000"

# Customizing `status`
POWERLEVEL9K_STATUS_VERBOSE="false"

# These Segments; context, vcs, rspec_stats, symfony2_tests, have additional color options

# Advanced `vcs` customization
# POWERLEVEL9K_HIDE_BRANCH_ICON="false"
# POWERLEVEL9K_SHOW_CHANGESET="true"
# POWERLEVEL9K_CHANGESET_HASH_LENGTH="6"
POWERLEVEL9K_VCS_FOREGROUND="000"
POWERLEVEL9K_VCS_BACKGROUND="002"
# POWERLEVEL9K_VCS_DARK_FOREGROUND="000"
# If VCS changes are detected:
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="000"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="048"

# Putting it together
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir) #os_icon
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time vcs rbenv virtualenv)
