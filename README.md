# Dot Files

[.home](./.home) contains the home directory files.

[setup.sh](setup.sh) is for setting up vim, git, languages, command line tools and basic applications.

[.scripts](.scripts) is a directory that holds utility scripts to be linked in the [.zshrc](.zshrc) file.

[vim_plugins](vim_plugins) contains information about what vim plugins are used in this repository.

[.gitignore_global](.gitignore_global) stores the global gitignore file.

[Brewfile](.home/Brewfile) contains a list of all brew dependencies.

[settings.json](settings.json) contains the vs code settings file.

Install fish

```sh
brew install fish
```

Install mise

```sh
curl https://mise.run | sh
echo '~/.local/bin/mise activate fish | source' >> ~/.config/fish/config.fish
```

eget

```sh
curl https://zyedidia.github.io/eget.sh | sh
mv eget ~/.local/bin/
```

Rust dependencies

```sh
cargo binstall analyze-remarks
cargo binstall aoc
cargo binstall arroyo
cargo binstall ast-grep
cargo binstall bat
cargo binstall bootimage
cargo binstall cargo
cargo binstall cargo-add
cargo binstall cargo-afl
cargo binstall cargo-android
cargo binstall cargo-apple
cargo binstall cargo-asm
cargo binstall cargo-audit
cargo binstall cargo-auditable
cargo binstall cargo-binstall
cargo binstall cargo-bloat
cargo binstall cargo-book
cargo binstall cargo-bootimage
cargo binstall cargo-clippy
cargo binstall cargo-cov
cargo binstall cargo-create-tauri-app
cargo binstall cargo-crev
cargo binstall cargo-debug
cargo binstall cargo-deny
cargo binstall cargo-dist
cargo binstall cargo-docs
cargo binstall cargo-eval
cargo binstall cargo-expand
cargo binstall cargo-flamegraph
cargo binstall cargo-fmt
cargo binstall cargo-fuzz
cargo binstall cargo-geiger
cargo binstall cargo-insta
cargo binstall cargo-install-update
cargo binstall cargo-install-update-config
cargo binstall cargo-license
cargo binstall cargo-llvm-lines
cargo binstall cargo-make
cargo binstall cargo-miri
cargo binstall cargo-mobile
cargo binstall cargo-msrv
cargo binstall cargo-mutants
cargo binstall cargo-nextest
cargo binstall cargo-nm
cargo binstall cargo-objcopy
cargo binstall cargo-objdump
cargo binstall cargo-outdated
cargo binstall cargo-profdata
cargo binstall cargo-public-api
cargo binstall cargo-readobj
cargo binstall cargo-release
cargo binstall cargo-remark
cargo binstall cargo-rm
cargo binstall cargo-semver-checks
cargo binstall cargo-set-version
cargo binstall cargo-shuttle
cargo binstall cargo-size
cargo binstall cargo-sqlx
cargo binstall cargo-strip
cargo binstall cargo-tauri
cargo binstall cargo-test-fuzz
cargo binstall cargo-udeps
cargo binstall cargo-upgrade
cargo binstall cargo-upgrades
cargo binstall cargo-watch
cargo binstall cargo-xb
cargo binstall cargo-xbuild
cargo binstall cargo-xc
cargo binstall cargo-xcheck
cargo binstall cargo-xclippy
cargo binstall cargo-xdoc
cargo binstall cargo-xfix
cargo binstall cargo-xinstall
cargo binstall cargo-xpublish
cargo binstall cargo-xr
cargo binstall cargo-xrun
cargo binstall cargo-xrustc
cargo binstall cargo-xt
cargo binstall cargo-xtest
cargo binstall clippy-driver
cargo binstall cross
cargo binstall cross-util
cargo binstall daktilo
cargo binstall daktilo-completions
cargo binstall daktilo-mangen
cargo binstall delta
cargo binstall diesel
cargo binstall diffsitter
cargo binstall diffsitter_completions
cargo binstall diffsitter-utils
cargo binstall diskonaut
cargo binstall duf
cargo binstall dust
cargo binstall efmt
cargo binstall evcxr
cargo binstall evcxr_jupyter
cargo binstall fd
cargo binstall fend
cargo binstall flamegraph
cargo binstall flawz
cargo binstall flawz-completions
cargo binstall flawz-mangen
cargo binstall fselect
cargo binstall fundoc
cargo binstall gitea-migrate
cargo binstall gitui
cargo binstall grex
cargo binstall hyperlink
cargo binstall jisho
cargo binstall just
cargo binstall leetui
cargo binstall license-generator
cargo binstall lms
cargo binstall lurk
cargo binstall lychee
cargo binstall makers
cargo binstall mdbook
cargo binstall mdbook-cmdrun
cargo binstall mdbook-exerciser
cargo binstall mdbook-gettext
cargo binstall mdbook-i18n-normalize
cargo binstall mdbook-katex
cargo binstall mdbook-keeper
cargo binstall mdbook-svgbob
cargo binstall mdbook-xgettext
cargo binstall mdcat
cargo binstall miniserve
cargo binstall numbat
cargo binstall pagefind
cargo binstall panamax
cargo binstall pb-rs
cargo binstall pomodoro
cargo binstall proximity-sort
cargo binstall pueue
cargo binstall pueued
cargo binstall qcp
cargo binstall rg
cargo binstall rless
cargo binstall rls
cargo binstall rpaste
cargo binstall rust-analyzer
cargo binstall rust-ar
cargo binstall rustc
cargo binstall rust-cov
cargo binstall rustdoc
cargo binstall rustfmt
cargo binstall rust-gdb
cargo binstall rust-gdbgui
cargo binstall rust-ld
cargo binstall rustlings
cargo binstall rust-lld
cargo binstall rust-lldb
cargo binstall rust-nm
cargo binstall rust-objcopy
cargo binstall rust-objdump
cargo binstall rust-profdata
cargo binstall rust-readobj
cargo binstall rust-size
cargo binstall rust-strip
cargo binstall rustup
cargo binstall rustypaste
cargo binstall rvim
cargo binstall sccache
cargo binstall sd
cargo binstall sg
cargo binstall slumber
cargo binstall speedtest-rs
cargo binstall speki
cargo binstall sqlx
cargo binstall stdrename
cargo binstall suppaftp
cargo binstall taskwarrior-tui
cargo binstall tickrs
cargo binstall tldr
cargo binstall tokei
cargo binstall trash
cargo binstall trunk
cargo binstall typos
cargo binstall typst-lsp
cargo binstall ugdb
cargo binstall wiki-tui
cargo binstall xsv
cargo binstall ya
cargo binstall yazi
cargo binstall zet
cargo binstall zoxide
```
