class BrewCnf < Formula
  desc "Fast drop-in replacement for brew command-not-found"
  homepage "https://github.com/cytsai1008/brew-cnf-rust"
  version "0.4.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-aarch64-apple-darwin.tar.gz"
      sha256 "ba49cd11233b736bc2f2624a027eebebe432274c3b448aab05b4cc1c31756c2b"
    end

    on_intel do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-x86_64-apple-darwin.tar.gz"
      sha256 "80534afc2b9ee129acb2df7c94819efdd4a448c3566640121f926cb755a0d76a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6becc37856a30c82b75b8a8dca182b5af9f1cc8ebf8e43749f35695fcf814f3f"
    end

    on_intel do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a209b2ccde8771bfb660082c87b722bc14a872bfbbd68189d4a590881eecc61"
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
