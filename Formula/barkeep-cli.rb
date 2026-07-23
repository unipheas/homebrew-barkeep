class BarkeepCli < Formula
  desc "CLI and developer integrations for the Busy Bar"
  homepage "https://github.com/unipheas/barkeep"
  url "https://github.com/unipheas/barkeep/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "8af752af3f8dd25f470906516f158df8d032a86311e6846117604beec5259957"
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
