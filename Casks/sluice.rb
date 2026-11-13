cask "sluice" do
  version "0.4.1"
  sha256 "d5cfecf607dba35217bb161a84de065429780161a998940353406eca990f5c5d"

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
