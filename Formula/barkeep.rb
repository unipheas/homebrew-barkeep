class Barkeep < Formula
  desc "Menu bar app and CLI for the Busy Bar over USB or Wi-Fi"
  homepage "https://github.com/unipheas/barkeep"
  url "https://github.com/unipheas/barkeep/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "3ef6e674923eaf3b90c8815dbcaf0d82f5401e2d1f60f8ec3f8877c40488cee9"
  license "MIT"
  head "https://github.com/unipheas/barkeep.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :sonoma

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install "bin/barkeep"

    app = prefix/"BarKeep.app"
    (app/"Contents/MacOS").mkpath
    (app/"Contents/Resources").mkpath
    cp ".build/release/BarKeep", app/"Contents/MacOS/BarKeep"
    cp "packaging/Info.plist", app/"Contents/Info.plist"
    cp "assets/AppIcon.icns", app/"Contents/Resources/AppIcon.icns"
    system "codesign", "--force", "-s", "-", app

    libexec.install "mcp/barkeep_mcp.py"
    pkgshare.install "hooks"
  end

  def caveats
    <<~EOS
      The menu bar app was built at:
        #{opt_prefix}/BarKeep.app

      Copy it into /Applications (copy, don't symlink — macOS ties
      permissions like Full Disk Access to the real bundle):
        cp -R #{opt_prefix}/BarKeep.app /Applications/
        open /Applications/BarKeep.app

      Because Homebrew builds it locally with an ad-hoc signature, if you
      later upgrade the formula you'll need to re-grant Full Disk Access
      (only needed for notification forwarding).

      MCP server (for Claude and other MCP clients):
        claude mcp add --scope user barkeep -- /usr/bin/python3 #{opt_libexec}/barkeep_mcp.py

      Claude Code hook scripts are in:
        #{opt_pkgshare}/hooks
    EOS
  end

  test do
    assert_match "barkeep", shell_output("#{bin}/barkeep 2>&1", 1)
  end
end
