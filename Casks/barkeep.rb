cask "barkeep" do
  version "1.0.11"
  sha256 "0d09725a7361149e84b2583c69202d19bd7a67cdf02e3f4ff2652ec658242594"

  url "https://github.com/unipheas/barkeep/releases/download/v#{version}/BarKeep-#{version}.zip"
  name "BarKeep"
  desc "Menu bar companion for the Busy Bar over USB or Wi-Fi"
  homepage "https://github.com/unipheas/barkeep"

  depends_on macos: :sonoma

  app "BarKeep.app"

  uninstall quit: "dev.barkeep.mac"
end
