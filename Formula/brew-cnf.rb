class BrewCnf < Formula
  desc "Fast drop-in replacement for brew command-not-found"
  homepage "https://github.com/cytsai1008/brew-cnf-rust"
  version "0.5.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-aarch64-apple-darwin.tar.gz"
      sha256 "ff16bf7975f793d1e59c105d62a3d199b38e63f8e1487480995fbe8ca83ea39b"
    end

    on_intel do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-x86_64-apple-darwin.tar.gz"
      sha256 "62b19e0f705e900b749d05924a1d69d526ea1eb6a1af16c0b8fe6fe6220cbd32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2249078778ebd327a914bf28eff0a19027f53fc61101449602344ca150a9a71a"
    end

    on_intel do
      url "https://github.com/cytsai1008/brew-cnf-rust/releases/download/v#{version}/brew-cnf-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "91cba06294e1c5dab1eebeeb134971a22f0c587fcdf95b9cc509affa7f00d3f3"
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
