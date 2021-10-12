# A bucket

A folder to receive incoming files, plus one script to process them.

First case scenario adds experimental data from the bucket to the current experiment analysis and runs the pipeline to update results.

## Creating a systemd timer

https://fedoramagazine.org/systemd-timers-for-scheduling-tasks/

Create the .service unit that will call the script above. Create the directory and file in `~/.config/systemd/user/bkt.service`.
Create the .timer in `~/.config/systemd/user/bkt.timer`.
`systemctl --user enable bkt.service`
`systemctl --user start bkt.service`

`systemctl --user enable schedule-test.timer`
`systemctl --user start schedule-test.timer`
