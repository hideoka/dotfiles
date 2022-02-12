DOTFILE_PATH=$1

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"
rustup update
rustup component add rustfmt clippy

cargo install ripgrep
cargo install --locked bat
cargo install git-delta
cargo install exa
cargo install tokei
cargo install xsv
cargo install cargo-edit
cargo install starship --locked
cargo install sqlx-cli

cd "$(dirname "$DOTFILE_PATH")"
git clone https://github.com/rust-analyzer/rust-analyzer.git && cd rust-analyzer
cargo xtask install --server
