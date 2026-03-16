cask "look-ma-no-hands" do
  version "1.4.0"
  sha256 "7073b7101e610c9d8949e52e7c9d2cd82c8fd37bf9b8662f9261d7ebe2491e0d"

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
