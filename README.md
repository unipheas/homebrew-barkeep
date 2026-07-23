# homebrew-barkeep

Homebrew tap for [BarKeep](https://github.com/unipheas/barkeep) — a macOS menu bar companion for the Busy Bar over USB or Wi-Fi.

## Install

```bash
brew tap unipheas/barkeep
brew install --cask barkeep
```

Homebrew installs `BarKeep.app` directly into `/Applications`.

For the `barkeep` CLI, MCP server, and Claude Code hooks:

```bash
brew install barkeep-cli
```

## Maintainer notes

After tagging a release in the main repo (for example, `v1.0.2`):

```bash
curl -sL https://github.com/unipheas/barkeep/archive/refs/tags/v1.0.2.tar.gz | shasum -a 256
```

Update `url` and `sha256` in `Formula/barkeep.rb`, commit, push. Users get the new version with `brew upgrade barkeep`.
