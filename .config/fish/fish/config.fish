set -x GOPATH "$HOME/go"
fish_add_path "$GOPATH/bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/bin"
fish_add_path "/usr/share/bcc/tools"
fish_add_path "$HOME/.ghcup/bin"
fish_add_path "$HOME/.yarn/bin"
fish_add_path "$HOME/.wasmtime/bin"

set -gx FLYCTL_INSTALL "$HOME/.fly"
fish_add_path "$FLYCTL_INSTALL/bin"

alias lynx "lynx -vikeys"

alias typos "typos --config ~/.config/typos/typos.toml"

fish_vi_key_bindings

alias vi nvim
alias vim nvim
alias open xdg-open

alias airplane-mode "rfkill toggle all"

set -x GPG_TTY (tty)
set -gx EDITOR "/bin/nvim"
set -gx VISUAL "/bin/nvim"
set -gx PAGER bat
set -gx MANPAGER bat
set -gx MONOREPO $HOME/monorepo
set -gx MOZ_ENABLE_WAYLAND 1
set -gx MOZ_DISABLE_RDD_SANDBOX 1
set -gx CARGO_INCREMENTAL 1
set -gx BROWSER firefox
set -gx WASMTIME_HOME "$HOME/.wasmtime"

alias ls "ls -a --color=auto"
alias grep "grep --color=auto"
alias vimdiff "vim -d"
alias pip3 "python3 -m pip"
alias python "python3"
alias git "hub"
alias more "bat"
alias less "bat"
alias cat "bat"

# BasicTex Support
# eval /usr/libexec/path_helper

alias musl-gcc "musl-gcc -static"

set FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --no-ignore-vcs'

source ~/.config/fish/functions/custom.fish

set -g -x fish_greeting ''
set -gx OPENAI_API_KEY "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"
# clear

# opam configuration
source /home/takashi/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
~/.local/bin/mise activate fish | source
