cask "sluice" do
  version "0.8.0"
  sha256 "8d067b770b14a73d3b933b0c0aafc87266165c568d1501ede5d078ac1dc46ebc"

  url "https://github.com/vikng-dev/sluice/releases/download/v#{version}/Sluice-v#{version}-macos.zip"
  name "Sluice"
  desc "Menu bar app that pools AI coding subscriptions behind one local address"
  homepage "https://github.com/vikng-dev/sluice"

  depends_on macos: :sonoma

  app "Sluice.app"
  binary "#{appdir}/Sluice.app/Contents/MacOS/Sluice", target: "sluice"

  # launchd keeps Sluice running, so it is told to let go before the app is swapped,
  # and the new app is opened to hand itself back.
  postflight_steps do
    run "/usr/bin/open", args: ["{{appdir}}/Sluice.app"]
  end

  uninstall launchctl: "dev.vikng.sluice.relay",
            quit:      "dev.vikng.sluice"

  zap trash: [
    "~/.config/sluice",
    "~/Library/Application Support/Sluice",
  ]
end
