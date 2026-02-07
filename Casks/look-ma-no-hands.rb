cask "look-ma-no-hands" do
  version "1.1.1"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"

  url "https://github.com/qaid/look-ma-no-hands/releases/download/v#{version}/LookMaNoHands-#{version}.zip"
  name "Look Ma No Hands"
  desc "System-wide voice dictation and meeting transcription"
  homepage "https://github.com/qaid/look-ma-no-hands"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Look Ma No Hands.app"

  uninstall quit: "com.lookmanohands.app"

  zap trash: [
    "~/Library/Application Support/LookMaNoHands",
    "~/Library/Caches/com.lookmanohands.app",
    "~/Library/Preferences/com.lookmanohands.app.plist",
  ]

  caveats <<~EOS
    Look Ma No Hands requires the following permissions:
    - Microphone access (for voice recording)
    - Accessibility access (for text insertion)
    - Screen Recording (for meeting mode)

    You will be prompted to grant these permissions on first launch.

    Press Caps Lock to start recording, speak, and auto-insert formatted text anywhere!
  EOS
end
