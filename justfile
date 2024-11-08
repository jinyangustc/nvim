[private]
default:
    @just -f {{ justfile() }} --list

sync-servers:
    ssh acies1 'cd ~/.config/nvim; git pull'
    ssh office 'cd ~/.config/nvim; git pull'
    ssh eugene 'cd ~/.config/nvim; git pull'
