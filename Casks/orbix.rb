cask "orbix" do
  version "0.1.0"
  sha256 "6cc5e9a67494df291c79ef8a086c98fd21e58d63441a8680e1cbaaf8ba9daf88"

  url "https://github.com/elrincondeisma/orbix/releases/download/v#{version}/Orbix-#{version}-arm64.dmg"
  name "Orbix"
  desc "Mascota de escritorio que vigila Claude Code y lleva las cuentas"
  homepage "https://github.com/elrincondeisma/orbix"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Orbix.app"

  zap trash: [
    "~/Library/Application Support/Orbix",
    "~/.claude/orbix",
  ]
end
