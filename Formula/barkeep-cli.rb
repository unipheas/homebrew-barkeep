class BarkeepCli < Formula
  desc "CLI and developer integrations for the Busy Bar"
  homepage "https://github.com/unipheas/barkeep"
  url "https://github.com/unipheas/barkeep/archive/refs/tags/v1.0.13.tar.gz"
  sha256 "451fb5fd1c91cc56f66faed4f7c203590c9b8360d1cf427112e9f7fb1766028c"
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
