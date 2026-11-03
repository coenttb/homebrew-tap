cask "birdwatch" do
  version "1.0.1"
  sha256 "b23211b3af806e637881cfde27422727282776c8779cb8873c05cb25325038ea"

  url "https://coenttb.com/birdwatch/Birdwatch-#{version}.zip?ref=homebrew"
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
