class Barkeep < Formula
  desc "CLI and developer integrations for the Busy Bar"
  homepage "https://github.com/unipheas/barkeep"
  url "https://github.com/unipheas/barkeep/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "3ef6e674923eaf3b90c8815dbcaf0d82f5401e2d1f60f8ec3f8877c40488cee9"
  license "MIT"
  revision 3

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
