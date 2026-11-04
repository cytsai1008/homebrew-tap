cask "mibuds-for-mac" do
  version "1.0.0"
  sha256 "5657f20aeb5504182e37469cbc76ff9bd5e7fd1176ec60fb12afb0ad5374cb70"

  url "https://github.com/cytsai1008/MiBudsForMac/releases/download/v#{version}/MiBuds.zip"
  name "MiBuds for Mac"
  desc "Menu bar app for Xiaomi and Redmi earbuds battery and noise control"
  homepage "https://github.com/cytsai1008/MiBudsForMac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "MiBuds.app"

  caveats <<~EOS
    MiBuds is not signed with an Apple Developer ID, so macOS blocks the first launch.
    To allow it, run:
      xattr -dr com.apple.quarantine #{appdir}/MiBuds.app
  EOS
end
