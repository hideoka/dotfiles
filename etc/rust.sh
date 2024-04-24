DOTFILE_PATH=$1

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"
rustup update
rustup component add rustfmt clippy rust-analyzer

cargo install ripgrep
cargo install bat --locked
cargo install git-delta
cargo install exa
cargo install tokei
cargo install xsv
cargo install cargo-edit
cargo install starship --locked
cargo install sqlx-cli
catgo install cargo-watch
cargo install sheldon --locked
cargo install mise
