cask "simstim" do
  version "0.16.0"
  sha256 "8bd56a44734fc33e743fb2fa21ec7ab08babaa78b6f5e3114e726b16f9ae08b7"

  url "https://github.com/pgrekovich/simstim/releases/download/v#{version}/Simstim_#{version}_aarch64.dmg"
  name "Simstim"
  desc "Local call recording and transcription into Markdown files"
  homepage "https://simstim.tech/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Signed with a Developer ID and notarized; Core Audio process taps need
  # macOS 14.2, which the app checks itself at launch.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  # The app updates itself from GitHub Releases; brew upgrade is still fine.
  auto_updates true

  app "Simstim.app"

  zap trash: [
    "~/.config/simstim",
    "~/Library/Application Support/simstim",
    "~/Library/Application Support/com.simstim.desktop",
    "~/Library/Caches/com.simstim.desktop",
    "~/Library/Preferences/com.simstim.desktop.plist",
    "~/Library/Saved Application State/com.simstim.desktop.savedState",
    "~/Library/WebKit/com.simstim.desktop",
  ]
end
