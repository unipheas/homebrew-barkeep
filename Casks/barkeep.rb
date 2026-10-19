cask "barkeep" do
  version "1.0.15"
  sha256 "8ab0770a2e80fbc9ca28542f3fcacf87da2fd70772c45551d4f05f12e1983166"

  url "https://github.com/unipheas/barkeep/releases/download/v#{version}/BarKeep-#{version}.zip"
  name "BarKeep"
  desc "Menu bar companion for the Busy Bar over USB or Wi-Fi"
  homepage "https://github.com/unipheas/barkeep"

  depends_on macos: :sonoma

  app "BarKeep.app"

  uninstall quit: "dev.barkeep.mac"
end
