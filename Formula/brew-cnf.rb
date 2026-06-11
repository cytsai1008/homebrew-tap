class BrewCnf < Formula
  desc "Fast drop-in replacement for brew command-not-found"
  homepage "https://github.com/cytsai1008/brew-cnf-rust"
  version "0.2.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-aarch64-apple-darwin.tar.gz"
      sha256 "73925783fce78c6daea9e0ae90f8f7ed087d36235e907117806f18c54e3ab171"
    end

    on_intel do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-x86_64-apple-darwin.tar.gz"
      sha256 "790ae280bad372f77fad8511f2b5a229f3e8db04ffed9aff6c281e9ae63cb803"
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
