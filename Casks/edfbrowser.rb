cask "edfbrowser" do
  version "2.14"
  sha256 "1f04687c6d10506f4b98b95959b247fc06f087fbbe50c44074b2e7f9bd880e40"

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
