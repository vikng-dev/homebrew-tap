cask "sluice" do
  version "0.7.0"
  sha256 "265e1b3120c5398b079d26b35db5936c92d09bfbc2b8cb9c397b0e54e835bbac"

  url "https://github.com/vikng-dev/sluice/releases/download/v#{version}/Sluice-v#{version}-macos.zip"
  name "Sluice"
  desc "Menu bar app that pools AI coding subscriptions behind one local address"
  homepage "https://github.com/vikng-dev/sluice"

  depends_on macos: :sonoma

  app "Sluice.app"
  binary "#{appdir}/Sluice.app/Contents/MacOS/Sluice", target: "sluice"

  # launchd keeps Sluice running, so it is told to let go before the app is swapped,
  # and the new app is opened to hand itself back.
  postflight do
    system_command "/usr/bin/open", args: ["#{appdir}/Sluice.app"]
  end

  uninstall launchctl: "dev.vikng.sluice.relay",
            quit:      "dev.vikng.sluice"

  zap trash: [
    "~/.config/sluice",
    "~/Library/Application Support/Sluice",
  ]
end
