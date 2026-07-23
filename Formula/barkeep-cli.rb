class BarkeepCli < Formula
  desc "CLI and developer integrations for the Busy Bar"
  homepage "https://github.com/unipheas/barkeep"
  url "https://github.com/unipheas/barkeep/archive/refs/tags/v1.0.10.tar.gz"
  sha256 "6e4381af589822002375dfce271bc3c3f5037d903ae3ac217536d5adb94eb430"
  license "MIT"
  depends_on macos: :sonoma

  def install
    bin.install "bin/barkeep"

    libexec.install "mcp/barkeep_mcp.py"
    pkgshare.install "hooks"
  end

  def caveats
    <<~EOS
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
