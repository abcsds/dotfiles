alias ll = ls -laf
alias opn = xdg-open
alias cat = bat
alias top = htop

alias mv = mv -iv # Confirm, verbose
alias cp = cp -iv # Confirm before overwriting
# alias rm = rm -t # Use trash

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


alias serve = python -m http.server
alias openPorts = sudo lsof -i -P -n | from ssv | find LISTEN
alias openTCP = sudo lsof -i -P -n | from ssv | find TCP
alias openUDP = sudo lsof -i -P -n | from ssv | find UDP
alias sshHosts = open ~/.ssh/config | lines | find -r "^Host" | replace "Host " ""
alias gateway = ip -o -4 route show to default

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

# Display my github repos
# alias ghrepos = gh repo list --json nameWithOwner,defaultBranchRef
# alias ghrepos = gh repo list --json nameWithOwner,defaultBranchRef --limit 100 | from json | get nameWithOwner | each { str split "/" $it | get 1 }

# Docker
# Kill all running containers
alias dockerkill = docker ps -q | each { docker kill $it }
# Remove all containers
alias dockerrm = docker ps -a -q | each { docker rm $it }
# Remove all images
alias dockerrmi = docker images -q | each { docker rmi $it }

# Pandoc
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
