cask "autoquit" do
  version "1.0.3"
  sha256 "10e6d0947a28fa5e6b427bda717368a05471fbadc96f1f73f8a31fe4ade8131e"

  url "https://github.com/yan-vikng-dev/AutoQuit/releases/download/v#{version}/AutoQuit-v#{version}.dmg"
  name "AutoQuit"
  desc "Menu bar app that closes apps after their last window is gone"
  homepage "https://github.com/yan-vikng-dev/AutoQuit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "AutoQuit.app"

  uninstall quit: "dev.yan.autoquit"

  zap trash: [
    "~/Library/Logs/AutoQuit",
    "~/Library/Preferences/dev.yan.autoquit.plist",
  ]
end
