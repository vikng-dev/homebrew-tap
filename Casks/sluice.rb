cask "sluice" do
  version "0.3.0"
  sha256 "130c2ffee7ac9fc0e2081dd9cb59710c8cecd841942fc5eedaf4633fb712e97d"

  url "https://github.com/vikng-dev/sluice/releases/download/v#{version}/Sluice-v#{version}-macos.zip"
  name "Sluice"
  desc "Menu bar app that pools AI coding subscriptions behind one local address"
  homepage "https://github.com/vikng-dev/sluice"

  depends_on macos: ">= :sonoma"

  app "Sluice.app"
  binary "#{appdir}/Sluice.app/Contents/MacOS/Sluice", target: "sluice"

  uninstall quit: "dev.vikng.sluice"

  zap trash: [
    "~/.config/sluice",
    "~/Library/Application Support/Sluice",
  ]
end
