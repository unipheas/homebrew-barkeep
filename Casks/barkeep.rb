cask "barkeep" do
  version "1.0.3"
  sha256 "dfde91eda8945c29ba83966148a557b99a9262b533922e6903b1c31a37f4dfdc"

  url "https://github.com/unipheas/barkeep/releases/download/v#{version}/BarKeep-#{version}.zip"
  name "BarKeep"
  desc "Menu bar companion for the Busy Bar over USB or Wi-Fi"
  homepage "https://github.com/unipheas/barkeep"

  depends_on macos: :sonoma

  app "BarKeep.app"

  caveats <<~EOS
    BarKeep is currently ad-hoc signed and not notarized. On first launch,
    right-click BarKeep in /Applications and choose Open, then Open again.
  EOS
end
