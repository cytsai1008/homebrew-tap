class BrewCnf < Formula
  desc "Fast drop-in replacement for brew command-not-found"
  homepage "https://github.com/cytsai1008/brew-cnf-rust"
  version "0.4.1"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-aarch64-apple-darwin.tar.gz"
      sha256 "0286201da56e13ebac23360cb962356d95f9cb43c899fb5da531d32c44bf8593"
    end

    on_intel do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-x86_64-apple-darwin.tar.gz"
      sha256 "ca9e8feb4334528ecb695bfa85183d6309f04df65efaa4bbad36a674c54c6b2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "66f7ac89d5c08580300acdf95d089ff4edd0283af2b522df6aa02ac036f5ec08"
    end

    on_intel do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e3a135c4dd262f4f124afe11037e1fa251096f2b2ad2ebb8aca6bbc11a3d08e"
    end
  end

  def install
    bin.install "brew-cnf"
  end

  test do
    output = shell_output("#{bin}/brew-cnf 2>&1", 1)
    assert_match "Usage: brew-cnf", output
  end
end
