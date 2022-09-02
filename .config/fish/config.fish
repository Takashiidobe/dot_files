function only_add_if_login --argument path_to_add
  if status is-login
    contains $path_to_add $PATH
    or else fish_add_path $path_to_add
  end
end

# GNU Utils
only_add_if_login "/usr/local/opt/coreutils/libexec/gnubin"
only_add_if_login "/usr/local/opt/findutils/libexec/gnubin"
only_add_if_login "/usr/local/opt/grep/libexec/gnubin"
only_add_if_login "/usr/local/opt/gnu-tar/libexec/gnubin"
only_add_if_login "/usr/local/opt/gnu-sed/libexec/gnubin"
only_add_if_login "/usr/local/opt/make/libexec/gnubin"
only_add_if_login "/usr/local/opt/inetutils/libexec/gnubin"

only_add_if_login "$HOME/.local/bin"
only_add_if_login "$GOPATH/bin"
only_add_if_login "$HOME/.cargo/bin"
only_add_if_login "$HOME/.deno/bin"
only_add_if_login "$HOME/.gem/ruby/2.7.0/bin"
only_add_if_login "$HOME/Library/Python/3.10"

only_add_if_login "$HOME/.jenv/bin"
only_add_if_login "$HOME/.rvm/bin/rvm"
fish_add_path /usr/local/opt/curl/bin
fish_add_path /usr/local/opt/python@3.10/Frameworks/Python.framework/Versions/3.10/bin

alias lynx "lynx -vikeys"

fish_vi_key_bindings

alias vi nvim
alias vim nvim

set -x GPG_TTY (tty)
set -gx EDITOR "/usr/local/bin/nvim"
set -gx VISUAL "/usr/local/bin/nvim"
set -gx PAGER bat
set -gx MANPAGER bat
set -gx MONOREPO $HOME/Desktop/monorepo

set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@3/lib/pkgconfig"

if status is-login
  [ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

  alias ls "gls -a --color=auto"
  alias grep "grep --color=auto"
  alias file_server "deno --allow-net https://deno.land/std/http/file_server.ts"
  alias vimdiff "vim -d"
  alias pip3 "python3 -m pip"
  alias python "python3"
  alias git "hub"
  alias more "bat"
  alias less "bat"
  alias cat "bat"

  # BasicTex Support
  eval /usr/libexec/path_helper

  set FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --no-ignore-vcs'

  set -x GOPATH "$HOME/go"
end

source /usr/local/opt/asdf/libexec/asdf.fish
source ~/.config/fish/functions/custom.fish

set -g -x fish_greeting ''
clear
