curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
rustup component add rustfmt clippy rls rust-analysis rust-src

cargo install ripgrep
cargo install --locked bat
cargo install delta
cargo install exa
cargo install rg
cargo install tokei
cargo install xsv
cargo install diesel_cli
