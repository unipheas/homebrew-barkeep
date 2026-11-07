cask "barkeep" do
  version "1.1.0"
  sha256 "d2f939a7749df79f858a1d7a9b411581691a9dd44293ce478b71eee7933d1b72"

  url "https://github.com/unipheas/barkeep/releases/download/v#{version}/BarKeep-#{version}.zip"
  name "BarKeep"
  desc "Menu bar companion for the Busy Bar over USB or Wi-Fi"
  homepage "https://github.com/unipheas/barkeep"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "BarKeep.app"

  uninstall quit: "dev.barkeep.mac"
end
