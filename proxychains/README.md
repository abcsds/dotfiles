1. Install **tor** (eg: `sudo pacman -S tor`)
2. Install **proxychains** (eg: `sudo pacman -S proxychains`)
3. Start **tor** service (eg systemctl: `sudo systemctl start tor`)
4. Enable **tor** service on boot (eg systemctl: `sudo systemctl enable tor`)
5. Start any application with **proxychains**. For example `proxychains firefox` and then go to URL http://www.showmyip.gr.
Your IP should me mascarade.
