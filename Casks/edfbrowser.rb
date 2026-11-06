cask "edfbrowser" do
  version "2.16,905"
  sha256 "6dafc0282ed43d428be7f22c23b475e11f022cc1a521a790b8d52a8b6399c27e"

  url "https://gitlab.com/-/project/72163637/uploads/e49cadea0e17a9925d39f3a8d8bcfb5f/EDFbrowser-2.16.dmg"
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
  depends_on macos: :sonoma

  app "EDFbrowser.app"

  zap trash: [
    "~/.EDFbrowser",
    "~/Library/Saved Application State/net.teuniz.EDFbrowser.savedState",
  ]
end
