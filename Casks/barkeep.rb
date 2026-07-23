cask "barkeep" do
  version "1.0.12"
  sha256 "89785386ff4c49978abbbdc32a3d30b2e94220eb3b4e64b01e957936742b532c"

  url "https://github.com/unipheas/barkeep/releases/download/v#{version}/BarKeep-#{version}.zip"
  name "BarKeep"
  desc "Menu bar companion for the Busy Bar over USB or Wi-Fi"
  homepage "https://github.com/unipheas/barkeep"

  depends_on macos: :sonoma

  app "BarKeep.app"

  uninstall quit: "dev.barkeep.mac"
end
