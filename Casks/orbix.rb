cask "orbix" do
  version "0.1.1"
  sha256 "22c9ea1def819db7f747cedf62f6a29319c4233a1ef7fe243f02c31c68b12d5f"

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
