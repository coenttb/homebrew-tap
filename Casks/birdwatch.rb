cask "birdwatch" do
  version "1.0"
  sha256 "12e82d80ec0eaada1b918146b2b0e96607de2a0816feeaffd4be6a9cbcc506aa"

  url "https://coenttb.com/birdwatch/Birdwatch-#{version}.zip"
  name "Birdwatch"
  desc "Menu bar monitor for stuck Swift and Xcode processes"
  homepage "https://coenttb.com/birdwatch"

  livecheck do
    url "https://coenttb.com/birdwatch/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :golden_gate
  depends_on arch: :arm64

  app "Birdwatch.app"

  uninstall quit: "com.coenttb.birdwatch"

  zap script: {
        executable:   "/usr/bin/security",
        args:         ["delete-generic-password", "-s", "com.coenttb.licensing.birdwatch", "-a", "license"],
        must_succeed: false,
      },
      trash:  [
        "~/Library/Application Support/Birdwatch",
        "~/Library/Caches/com.coenttb.birdwatch",
        "~/Library/HTTPStorages/com.coenttb.birdwatch",
        "~/Library/Preferences/com.coenttb.birdwatch.plist",
        "~/Library/Saved Application State/com.coenttb.birdwatch.savedState",
      ]
end
