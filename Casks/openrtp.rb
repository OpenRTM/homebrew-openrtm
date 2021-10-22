#============================================================
# OpenRTP-aist cask for HomeBrew
#
# Author: Noriaki Ando <Noriaki.Ando@gmail.com>
# GitHub: https://github.com/OpenRTM/homebrew-openrtm
#============================================================
cask "openrtp" do
  version "1.2.2"
  sha256 "e7a590a0615e81c9721d8acd828e0d9e29ac25ff012e51e2356ffb3e80389897"

  url "https://github.com/OpenRTM/homebrew-openrtm/releases/download/1.2.2/openrtp_v1.2.2-2.dmg"
  name "OpenRTP-aist"
  desc "Open RT Platform tool chain"
  homepage "https://openrtm.org/"

  depends_on cask: "homebrew/cask-versions/adoptopenjdk8"

  app "OpenRTP.app"

  caveats do
    depends_on_java "8"
  end
end
