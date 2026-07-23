cask "barkeep" do
  version "1.0.7"
  sha256 "0b8135128b8f4079da13730bc0dbf13545a4a712e195c6905a78c001173daca5"

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
