DOTFILE_PATH=$1

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
rustup component add rustfmt clippy

cargo install ripgrep
cargo install --locked bat
cargo install delta
cargo install exa
cargo install rg
cargo install tokei
cargo install xsv
cargo install diesel_cli
cargo install cargo-edit

cd "$(dirname "$DOTFILE_PATH")"
git clone https://github.com/rust-analyzer/rust-analyzer.git && cd rust-analyzer
cargo xtask install --server
