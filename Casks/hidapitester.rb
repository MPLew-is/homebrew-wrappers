cask "hidapitester" do
  arch arm:   "arm64",
       intel: "x86_64"

  version "0.2"
  sha256 arm:   "39b6cd77cb689615f39fdbaf2c1ca1ee4e17eefced81491cad6f9dab24e9b5f5",
         intel: "f712c0f2b6da0ed33761d18f6c8d6f64cd2063599b9c7632907cd4de7fd45123"

  url "https://github.com/todbot/hidapitester/releases/download/#{version}/hidapitester-macos-#{arch}.zip"
  name "hidapitester"
  desc "Simple command-line program to test HIDAPI"
  homepage "https://github.com/todbot/hidapitester"

  binary "hidapitester"

  postflight do
    # macOS quarantines unknown apps; undo that to allow the app to open without further modification.
    system_command 'xattr',
                    args: [
                      '-r',
                      '-d', 'com.apple.quarantine',
                      "#{staged_path}/hidapitester"
                    ]
  end
end
