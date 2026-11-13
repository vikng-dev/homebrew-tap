cask "sluice" do
  version "0.10.0"
  sha256 "f816d38ebe028a0dd3cf5729a8b854e08812fc49a39ec640147f8e8d74634336"

  url "https://github.com/vikng-dev/sluice/releases/download/v#{version}/Sluice-v#{version}-macos.zip"
  name "Sluice"
  desc "Menu bar app that pools AI coding subscriptions behind one local address"
  homepage "https://github.com/vikng-dev/sluice"

  depends_on macos: :sonoma

  app "Sluice.app"
  binary "#{appdir}/Sluice.app/Contents/MacOS/Sluice", target: "sluice"

  # Nothing here stops or starts Sluice. A running copy follows its own app: replaced,
  # it restarts into the new one; removed, it quits. Open it once after the first install.
  zap trash: [
    "~/.config/sluice",
    "~/Library/Application Support/Sluice",
  ]
end
