curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
rustup component add rustfmt clippy rls rust-analysis rust-src

cargo install ripgrep
cargo install --locked bat
