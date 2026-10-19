class BarkeepCli < Formula
  desc "CLI and developer integrations for the Busy Bar"
  homepage "https://github.com/unipheas/barkeep"
  url "https://github.com/unipheas/barkeep/archive/refs/tags/v1.0.15.tar.gz"
  sha256 "e79a4353b135229d3dfae1cde8c14a2d8d1e10724cb1793d1653a23b49faa404"
  license "MIT"
  depends_on macos: :sonoma

  def install
    bin.install "bin/barkeep"

    libexec.install "mcp/barkeep_mcp.py"
    pkgshare.install "hooks"
  end

  def caveats
    <<~EOS
      MCP server for Claude Code:
        claude mcp add --scope user barkeep -- /usr/bin/python3 #{opt_libexec}/barkeep_mcp.py

      MCP server for Codex and ChatGPT desktop:
        codex mcp add barkeep -- /usr/bin/python3 #{opt_libexec}/barkeep_mcp.py

      Claude and Codex hook scripts are in:
        #{opt_pkgshare}/hooks

      For Wi-Fi, set BARKEEP_HOST to the bar's IP address and BARKEEP_TOKEN
      to its local HTTP API password. Cloud API tokens do not work locally.
    EOS
  end

  test do
    assert_match "barkeep", shell_output("#{bin}/barkeep 2>&1", 1)
  end
end
