cask "barkeep" do
  version "1.0.13"
  sha256 "52d9eedb94bdf4119ddaa18900421715a64ce1df0555a222caedc717a20d8e25"

  url "https://github.com/unipheas/barkeep/releases/download/v#{version}/BarKeep-#{version}.zip"
  name "BarKeep"
  desc "Menu bar companion for the Busy Bar over USB or Wi-Fi"
  homepage "https://github.com/unipheas/barkeep"

  depends_on macos: :sonoma

  app "BarKeep.app"

  uninstall quit: "dev.barkeep.mac"
end
