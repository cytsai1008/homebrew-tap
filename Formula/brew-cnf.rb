class BrewCnf < Formula
  desc "Fast drop-in replacement for brew command-not-found"
  homepage "https://github.com/cytsai1008/brew-cnf-rust"
  version "0.6.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-aarch64-apple-darwin.tar.gz"
      sha256 "7fc1b79e43b1519149fe29a4f2fc1a2de7553ad32ec3ed77319284f792a0f37e"
    end

    on_intel do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-x86_64-apple-darwin.tar.gz"
      sha256 "99938d26f549e3ae78731cd503f214f679e9f28d6680585184513b855f7840e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe7176858c6623c906a72d05da189b33ee4b3759ebc6fb5f156b4e678f1e80b3"
    end

    on_intel do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2348af54a4a91d483bf2a2b5b80226a658f6ad85158c633c998d55473db1ecb1"
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
