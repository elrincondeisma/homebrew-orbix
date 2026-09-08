cask "orbix" do
  version "0.1.2"
  sha256 "fb632392be497b66bb2810aee5fc20f1df7516d07b5ae583440385a636c5aa60"

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
