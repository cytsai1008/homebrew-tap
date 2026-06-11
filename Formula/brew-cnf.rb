class BrewCnf < Formula
  desc "Fast drop-in replacement for brew command-not-found"
  homepage "https://github.com/cytsai1008/brew-cnf-rust"
  version "0.3.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v0.3.0/brew-cnf-aarch64-apple-darwin.tar.gz"
      sha256 "6eb13dedd844d88c38e02010854211d637ca3cf88787abd63eb34e16425658d2"
    end

    on_intel do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v0.3.0/brew-cnf-x86_64-apple-darwin.tar.gz"
      sha256 "b5c2a1f7c76097fd5d45f555a52e7566fb38399e2132d4221c68e30e6bc2cc33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v0.3.0/brew-cnf-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3410386cc717f281531d6d8d96fe9fb20d7f43dcd4423a4296935931fdd0462b"
    end

    on_intel do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v0.3.0/brew-cnf-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f794eccc56b80c27b3ebaef0fbb5e576fefa856125ff7d3022da10d64e48577"
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
