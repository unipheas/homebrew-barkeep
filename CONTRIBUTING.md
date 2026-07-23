# Contributing to the BarKeep Homebrew tap

This repository packages
[BarKeep](https://github.com/unipheas/barkeep) for Homebrew. Application bugs,
features, and source changes belong in the main repository. Tap contributions
should focus on installation, upgrades, package metadata, and release
automation.

## Release updates

After a signed and notarized BarKeep release is public:

1. Update the version and release ZIP hash in `Casks/barkeep.rb`.
2. Update the source tag and archive hash in `Formula/barkeep-cli.rb`.
3. Run:

   ```bash
   ruby -c Casks/barkeep.rb
   ruby -c Formula/barkeep-cli.rb
   brew style Casks/barkeep.rb Formula/barkeep-cli.rb
   ```

4. Push the branch and let a maintainer review the exact URLs, versions, and
   hashes.
5. After merge, run strict Homebrew audits and test upgrades on a clean Mac.

## Pull requests

Keep package changes focused and explain:

- Which BarKeep release or packaging issue the change addresses
- How release and source hashes were calculated
- Which Homebrew syntax, style, audit, install, or upgrade checks passed

Never include API passwords, tokens, signing credentials, private keys, or
notarization credentials.

Contributions are distributed under this tap's [MIT License](LICENSE).
