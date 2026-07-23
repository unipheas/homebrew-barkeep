# homebrew-barkeep

Official Homebrew tap for
[BarKeep](https://github.com/unipheas/barkeep) — the open-source macOS menu bar
companion, CLI, and developer toolkit for the Busy Bar over USB or Wi-Fi.

BarKeep and this tap are released under the [MIT License](LICENSE). Forks,
modifications, and contributions are welcome under the same terms.

## Install

```bash
brew tap unipheas/barkeep
brew install --cask barkeep
```

Homebrew installs `BarKeep.app` directly into `/Applications`.

For the `barkeep` CLI, MCP server, Claude Code hooks, and Codex/ChatGPT
integrations:

```bash
brew install barkeep-cli
```

The app version appears in the bottom-right of the BarKeep menu. Upgrade both
packages with:

```bash
osascript -e 'quit app "BarKeep"' 2>/dev/null || true
brew update
brew upgrade --cask barkeep
brew upgrade barkeep-cli
open -a BarKeep
```

## Wi-Fi setup

USB uses the Busy Bar's fixed `10.0.4.20` address without authentication. For
Wi-Fi, enable HTTP API access in the bar's local web interface, set its numeric
password, then enter the Wi-Fi address and that password in BarKeep Settings.

Use the physical bar's local HTTP API password. Tokens generated at
`cloud.busy.app` target the cloud API and do not authenticate the local device.

## Codex and ChatGPT desktop

Register the installed MCP server:

```bash
codex mcp add barkeep -- /usr/bin/python3 "$(brew --prefix barkeep-cli)/libexec/barkeep_mcp.py"
```

For Wi-Fi, add `BARKEEP_HOST` and the local HTTP API password:

```bash
codex mcp add barkeep \
  --env BARKEEP_HOST=YOUR_BAR_IP \
  --env BARKEEP_TOKEN=YOUR_HTTP_API_PASSWORD \
  -- /usr/bin/python3 "$(brew --prefix barkeep-cli)/libexec/barkeep_mcp.py"
```

The installed Codex notifier and hook examples are under:

```bash
$(brew --prefix barkeep-cli)/share/barkeep-cli/hooks
```

See the main project's
[Codex and ChatGPT desktop instructions](https://github.com/unipheas/barkeep#codex-and-chatgpt-desktop)
for the `config.toml` and hooks configuration.

## Maintainer notes

After the signed and notarized release archive is public, choose its version
and calculate both hashes:

```bash
VERSION=x.y.z # replace x.y.z with the release version
curl -sL \
  "https://github.com/unipheas/barkeep/releases/download/v$VERSION/BarKeep-$VERSION.zip" |
  shasum -a 256
curl -sL \
  "https://github.com/unipheas/barkeep/archive/refs/tags/v$VERSION.tar.gz" |
  shasum -a 256
```

Update `url` and `sha256` in `Formula/barkeep-cli.rb`, plus `version` and
`sha256` in `Casks/barkeep.rb`. Validate the definitions before pushing:

```bash
ruby -c Casks/barkeep.rb
ruby -c Formula/barkeep-cli.rb
brew style Casks/barkeep.rb Formula/barkeep-cli.rb
```

After pushing, run strict audits against the public tap and perform the upgrade
sequence above on a clean Mac.

## Contributing

For application changes, issues, and feature requests, use the
[main BarKeep repository](https://github.com/unipheas/barkeep). Pull requests
that update the cask, formula, installation guidance, or release automation are
welcome in this tap. See [CONTRIBUTING.md](CONTRIBUTING.md) for the release and
validation workflow.

Never commit API passwords, service tokens, signing credentials, or private
keys. Report security concerns through
[BarKeep's private security advisory form](https://github.com/unipheas/barkeep/security/advisories/new);
see [SECURITY.md](SECURITY.md) for scope and reporting guidance.
