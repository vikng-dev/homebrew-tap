cask "sluice" do
  version "0.11.0"
  sha256 "ede972b80c790773b8a7d6a73b7ca81b8ee6d448b866405b5722398f2b7f592a"

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
