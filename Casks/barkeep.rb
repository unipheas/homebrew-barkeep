cask "barkeep" do
  version "1.0.4"
  sha256 "ea059df0fd55142a4e6b120362936b7c812d73bf6a404c121b5dae743da70a48"

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
