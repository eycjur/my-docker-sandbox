# Docker-based simple Sandbox

## Quick Start

Install docker sandbox

```bash
brew trust --cask docker/tap/sbx@nightly
brew install docker/tap/sbx
sbx login
```

Start Sandbox

```shell
make build
make run
claude --dangerously-skip-permissions
```
