cask "mibuds-for-mac" do
  version "1.1.0"
  sha256 "9ca9c3aa64e0d92598e78658a66022dbe330fc4660b5ff646662264ae61eafd0"

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
