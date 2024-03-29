#!/bin/sh
set -eu

# Install pkgx plugins
# command -v "chezmoi" >/dev/null 2>&1 || pkgx install chezmoi.io~2.34

# pkgx install crates.io/git-delta^0.15
# pkgx install crates.io/gitui@latest
# pkgx install crates.io/ripgrep@latest
# pkgx install crates.io/vivid^0.9
# pkgx install crates.io/zellij~0.38
command -v "git" >/dev/null 2>&1 || pkgx install git-scm.org^2.40
pkgx install github.com/junegunn/fzf@latest
pkgx install github.com/peltoche/lsd^1
pkgx install starship.rs~1.16