cask "edfbrowser" do
  version "2.15,895"
  sha256 "69810f1406ec6b318acc718af783bfb046f6d5ca8a15def18e9bdf7c996d919e"

  url "https://gitlab.com/-/project/72163637/uploads/9ed66b7d59f7494f209f228cacedb6f6/EDFbrowser-2.15.dmg"
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
