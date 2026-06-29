# Claude Sandbox

[Apple container](https://github.com/apple/container) 上で Claude Code を動かす開発環境です。  
`ubuntu:26.04` ベースのカスタムイメージを CI で arm64 ビルドし、Docker Hub から pull して Mac 上で使います。

## 前提

- Apple Silicon Mac
- macOS 26 以降

## セットアップ

```bash
make install
```

`container` CLI のインストール（未導入時）と `container system start --enable-kernel-install` を実行します。

## 使い方

```bash
make run
```

初回はイメージを pull してコンテナを作成し、zsh（login shell）に入ります。2回目以降は起動してから接続します。

コンテナ内で Claude Code を起動する例:

```bash
claude --dangerously-skip-permissions
```

コンテナ内で Web サーバーなどを動かす場合、アプリは `0.0.0.0` で listen してください。Mac からはコンテナ IP 経由でアクセスします。

```bash
# コンテナ内
python3 -m http.server 8000 --bind 0.0.0.0

# Mac 側（デフォルト PORT=8000）
make open

# ポートを変える場合
make open PORT=5173
```

| コマンド | 説明 |
|----------|------|
| `make run` | コンテナを作成/起動して zsh に入る |
| `make open` | コンテナ IP:PORT をブラウザで開く（`PORT` 既定値: 8000） |
| `make stop` | コンテナを停止する |
| `make rm` | コンテナを削除する |
| `make help` | コマンド一覧を表示する |

## イメージのビルド

CI（`ubuntu-26.04-arm`）で Docker Hub へ push:

```bash
make build
```

> [!WARNING]
> Makefile の `DOCKER_HUB_USERNAME` は `eycjur` 固定です。自分のイメージを使う場合は書き換えてください。
