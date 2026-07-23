cask "barkeep" do
  version "1.0.6"
  sha256 "874417c36970587ed786e59da9b762c8b3442534b240c5741af93eb7f8a41b0b"

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
