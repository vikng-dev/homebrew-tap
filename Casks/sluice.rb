cask "sluice" do
  version "0.9.0"
  sha256 "795847a0fb3650c434b25cc5cd09bbca7837c769bab584b0243fbf55b8f149c7"

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
