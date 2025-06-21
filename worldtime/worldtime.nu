#!/usr/bin/env nu
# Define the worldtime command
def worldtime [] {
    # Determine the config file path.
    let config_path = (
        if ($env.XDG_CONFIG_HOME | empty) {
            $env.HOME + "/.config/worldtime/config.toml"
        } else {
            $env.XDG_CONFIG_HOME + "/worldtime/config.toml"
        }
    );

    # Read the config file (assumed to be TOML with a key `timezones`)
    let config = (open $config_path | from toml);
    let zones = $config.timezones;

    # Get today’s date as YYYY-MM-DD
    let today = (date now | date format "%Y-%m-%d");

    # Generate a list of hour labels (00:00 to 23:00)
    let hours = (range 0 23 | each { echo (if $it < 10 { "0$it:00" } else { "$it:00" }) });

    # For every timezone, compute a list of the corresponding local times.
    # (Uses GNU date: we set TZ on the fly.)
    let rows = (
        $zones | each {
            let zone = $it;
            let times = (
                $hours | each {
                    let hour = $it;
                    # Build a date string (e.g. "2025-03-28 09:00")
                    let dt = $today + " " + $hour;
                    # Use an external date command with the TZ environment variable.
                    # (Ensure your system’s date supports the -d option.)
                    let local = (env TZ=$zone date -d "$dt" +"%H:%M" | str trim);
                    $local
                }
            );
            { timezone: $zone, times: $times }
        }
    );

    # Convert each row’s “times” list into individual columns named 00, 01, … 23.
    let final_rows = (
        $rows | each {
            let rec = { timezone: $it.timezone };
            for idx in (range 0 23) {
                let col_name = (if $idx < 10 { "0$idx" } else { "$idx" });
                let rec = $rec | insert $col_name ($it.times[$idx]);
                $rec
            }
            $rec
        }
    );

    # Print the table.
    $final_rows | table
}

# --- Test block ---
# If the script is run with the argument "test", we create a temporary config file and run worldtime.
if ($args.0 == "test") {
    # Create a temporary directory for testing
    let temp_dir = (mktemp -d);
    # Build the config file path inside the temp directory
    let config_path = $temp_dir + "/worldtime/config.toml";
    # Create the parent directory (uses external command "mkdir" with -p)
    mkdir -p (echo $config_path | split column "/" | drop-last | str join "/");
    # Create a sample config file with a list of timezones.
    let test_config = '''
timezones = ["UTC", "America/New_York", "Asia/Tokyo"]
''';
    echo $test_config | save $config_path;
    # Set XDG_CONFIG_HOME to the temporary directory so our command uses the test config.
    let-env XDG_CONFIG_HOME = $temp_dir;
    # Run the worldtime command
    worldtime;
} else {
    worldtime;
}
