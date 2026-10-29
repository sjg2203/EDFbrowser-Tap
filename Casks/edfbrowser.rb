cask "edfbrowser" do
  version "2.15"
  sha256 "61fdc68371be4b6bab4c82f37d44a2fc77e177163d470022c2b89a258b3d24b0"

  url "https://gitlab.com/sjg2203/edfbrowser-silicon/-/jobs/artifacts/v#{version}/raw/build_output/EDFbrowser-v#{version}.dmg?job=package_dmg"
  name "EDFbrowser"
  desc "EDF+ and BDF+ viewer and toolbox – Apple Silicon build"
  homepage "https://gitlab.com/sjg2203/edfbrowser-silicon"

  livecheck do
    url "https://gitlab.com/api/v4/projects/72163637/repository/tags"
    strategy :json do |json|
      json.map do |tag|
        next unless tag["name"]

        tag["name"][/^v?(\d+(?:\.\d+)+)$/i, 1]
      end
    end
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "EDFbrowser.app"

  zap trash: [
    "~/.EDFbrowser",
    "~/Library/Saved Application State/net.teuniz.EDFbrowser.savedState",
  ]
end
