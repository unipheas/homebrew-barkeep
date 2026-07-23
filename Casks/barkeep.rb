cask "barkeep" do
  version "1.0.10"
  sha256 "02b3a13702bddf4a1eebb20fd44da02bfc3a025f854df72397a8b5b7bf2646e0"

  url "https://github.com/unipheas/barkeep/releases/download/v#{version}/BarKeep-#{version}.zip"
  name "BarKeep"
  desc "Menu bar companion for the Busy Bar over USB or Wi-Fi"
  homepage "https://github.com/unipheas/barkeep"

  depends_on macos: :sonoma

  app "BarKeep.app"

  uninstall quit: "dev.barkeep.mac"
end
