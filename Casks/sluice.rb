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

  # launchd keeps Sluice running, so it is told to let go before the app is swapped,
  # and the new app is opened to hand itself back. Not `postflight_steps`: its steps run
  # sandboxed, where `open` cannot reach LaunchServices (-10810) and the upgrade fails.
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
