# Template for Python and Rust projects

A template for Python and/or Rust projects to be developed in a (remote) Docker container with VS Code.

## How to use

1. Open as a folder in VS Code (directly or with Remote-SSH)
2. Edit `.devcontainer/devcontainer.json` for one's needs
3. Build a base image for the project (Dockerfile in the root directory)
```
docker build -t image_base .
docker build --no-cache -t image_base .
```
4. Reopen in Conainer in VS Code (Dev Containers). VS code uses Dockerfile in the `.devcontainer` directory, which simply uses base image so that reopening in a concatiner would not trigger a separate image build. If one needs to add any packages, one needs to rebuild the base image first.

## How to run Python

Python and Jupyter Notebooks work out of the box
```
python xxx.py
/usr/local/bin/python /workspaces/xxx.py
```

## How to run Rust


- To create a workspace, crate a `Cargo.toml` with
```
[workspace]

members = [
    "xxx",
]
```

- Create a library
```
cargo new xxx --lib --vcs none
```

- Create a binary
```
cargo new xxx --bin --vcs none
```

- Run (and build if not yet built) a binary
```
RUST_LOG=debug cargo run --package xxx --bin xxx --release
RUST_LOG=info cargo run --package xxx --bin xxx --release
```
