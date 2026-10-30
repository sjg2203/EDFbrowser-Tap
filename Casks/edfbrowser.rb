cask "edfbrowser" do
  version "2.15,893"
  sha256 "5334d31f2a349115cb79a185f9d331b959f340f263bf7592cb566fc97917e4a6"

  url "https://gitlab.com/-/project/72163637/uploads/ebae169074a4a2187cdf16d20947ec9d/EDFbrowser-v2-15.dmg"
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
