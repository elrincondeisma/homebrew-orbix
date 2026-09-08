cask "orbix" do
  version "0.1.3"
  sha256 "c2b5e14e99ed01577ecb5cf320174f9a0e2faa005345152cfe8810548d477bf9"

  url "https://github.com/elrincondeisma/orbix/releases/download/v#{version}/Orbix-#{version}-arm64.dmg"
  name "Orbix"
  desc "Mascota de escritorio que vigila Claude Code y lleva las cuentas"
  homepage "https://github.com/elrincondeisma/orbix"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Orbix.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/Orbix.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Orbix",
    "~/.claude/orbix",
  ]
end
