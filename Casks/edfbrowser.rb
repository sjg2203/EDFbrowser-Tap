cask "edfbrowser" do
  version "2.14"
  sha256 "d775de567fb2e492762f4d15c378b4217e1e80283b7ada31f53cab6c90fbed12"

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
