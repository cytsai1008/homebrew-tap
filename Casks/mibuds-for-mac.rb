cask "mibuds-for-mac" do
  version "1.2.1"
  sha256 "3fcd9f98431466ae9880edbde5e1ce8f8febc3d9695b306949fb4c4de8e368fd"

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
