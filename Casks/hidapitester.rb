cask "hidapitester" do
  version "0.3"
  sha256 "07d12bfcd830076c459e35df88a0a85840b989f6228324255da6c907ba53ebf2"

  url "https://github.com/todbot/hidapitester/releases/download/#{version}/hidapitester-macos-arm64-x86_64.zip"
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
