class BrewCnf < Formula
  desc "Fast drop-in replacement for brew command-not-found"
  homepage "https://github.com/cytsai1008/brew-cnf-rust"
  version "0.7.1"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-aarch64-apple-darwin.tar.gz"
      sha256 "61b3739594cd8a36a3eea708d8ce948d47ee996cdae19d1f5b654c0208838b68"
    end

    on_intel do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-x86_64-apple-darwin.tar.gz"
      sha256 "da3df5bb4087293982c287a46b93eb189e7d97e8d353927303e694b379fc847f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bff759ba337736da52c7c93ab45c9e6e12415ef7af77fd67ce7decbfc3bcdd77"
    end

    on_intel do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "556835cb8dc8bee9cd551a96751d5ee8ba257a6ba32b007a71f663e6357195e3"
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
