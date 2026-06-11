class BrewCnf < Formula
  desc "Fast drop-in replacement for brew command-not-found"
  homepage "https://github.com/cytsai1008/brew-cnf-rust"
  url "https://github.com/cytsai1008/brew-cnf-rust/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "caff9d4641d5e92076e1a72c80aac982ddaa187a76aa99afe55fb05880f06dd9"
  version "0.1.0"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/brew-cnf 2>&1", 1)
    assert_match "Usage: brew-cnf", output
  end
end
