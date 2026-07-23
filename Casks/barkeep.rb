cask "barkeep" do
  version "1.0.9"
  sha256 "4fd153b211a312a240b39f80b70ebb830e7e485627b1fb1e89c59088a14368ae"

  url "https://github.com/unipheas/barkeep/releases/download/v#{version}/BarKeep-#{version}.zip"
  name "BarKeep"
  desc "Menu bar companion for the Busy Bar over USB or Wi-Fi"
  homepage "https://github.com/unipheas/barkeep"

  depends_on macos: :sonoma

  app "BarKeep.app"

  uninstall quit: "dev.barkeep.mac"
end
