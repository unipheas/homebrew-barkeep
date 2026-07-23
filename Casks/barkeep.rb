cask "barkeep" do
  version "1.0.5"
  sha256 "ca7c76043cfce5295ff310949d135aaeb64f1ac08df83595283d95762f153a3a"

  url "https://github.com/unipheas/barkeep/releases/download/v#{version}/BarKeep-#{version}.zip"
  name "BarKeep"
  desc "Menu bar companion for the Busy Bar over USB or Wi-Fi"
  homepage "https://github.com/unipheas/barkeep"

  depends_on macos: :sonoma

  app "BarKeep.app"

  uninstall quit: "dev.barkeep.mac"

  caveats <<~EOS
    BarKeep is currently ad-hoc signed and not notarized. On first launch,
    right-click BarKeep in /Applications and choose Open, then Open again.
  EOS
end
