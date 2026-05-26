cask "edfbrowser" do
  version "2.14"
  sha256 "9945e686cb0ef537df86a06841352ea7f4cadf2eab8c6d13f9d27090e4ebb107"

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
  depends_on macos: ">= :ventura"

  app "EDFbrowser.app"

  zap trash: [
    "~/.EDFbrowser",
    "~/Library/Saved Application State/net.teuniz.EDFbrowser.savedState",
  ]
end
