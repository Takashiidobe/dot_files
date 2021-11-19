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
# only_add_if_login "/usr/local/opt/binutils/bin"

only_add_if_login "$HOME/.local/bin"
only_add_if_login "$GOPATH/bin"
only_add_if_login "$HOME/.cargo/bin"
only_add_if_login "$HOME/.deno/bin"
only_add_if_login "/usr/local/smlnj/bin"
only_add_if_login "/usr/local/opt/luajit-openresty/bin"
only_add_if_login "/usr/local/Cellar/llvm/13.0.0/bin"
only_add_if_login "$HOME/.gem/ruby/2.7.0/bin"
only_add_if_login "$HOME/Library/Python/3.9"

only_add_if_login "$HOME/.jenv/bin"
only_add_if_login "$HOME/.rvm/bin/rvm"
fish_add_path /usr/local/opt/curl/bin

alias lynx "lynx -vikeys"

fish_vi_key_bindings

alias vi nvim
alias vim nvim

set -x GPG_TTY (tty)
set -gx EDITOR nvim
set -gx VISUAL nvim
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
  # uncomment when using ruby
  rvm default
  
  # uncomment when using java
  # status --is-interactive; and source (jenv init -| psub)
  
  # uncomment when using node
  nvm use --lts
end

function sync_books
  rsync -rvz -e "ssh -p 2222" --update --include-from="$HOME/.androidignore" --progress "$HOME/Desktop/monorepo/books/" "192.168.1.227:/sdcard/Documents/books/"
end

function sync_music
  rsync -rvz -e "ssh -p 2222" --update --progress /Volumes/External/music/ "192.168.1.227:/sdcard/Music"
end

function sync_papers
  rsync -rvz -e "ssh -p 2222" --update --include-from="$HOME/.androidignore" --progress "$HOME/Desktop/monorepo/papers/papers" "192.168.1.227:/sdcard/Documents/papers/"
end

function kill_docker
  ps ax|grep -i docker|egrep -iv 'grep|com.docker.vmnetd'|awk '{print $1}'|xargs kill
end

set -g -x fish_greeting ''
clear
