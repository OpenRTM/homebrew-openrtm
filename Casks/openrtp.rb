#============================================================
# OpenRTP-aist cask for HomeBrew
#
# Author: Noriaki Ando <Noriaki.Ando@gmail.com>
# GitHub: https://github.com/OpenRTM/homebrew-openrtm
#============================================================
cask "openrtp" do
  version "1.2.2"
  sha256 "d3596c0d3f3965360d74f6852f5db17b47d3614f837747f54c77a7b5b4099cf2"
  
  url "https://github.com/OpenRTM/OpenRTP-aist/releases/download/v1.2.2/openrtp_v1.2.2.dmg"
  name "OpenRTP-aist"
  desc "Open RT Platform tool chain"
  homepage "https://openrtm.org/"

  depends_on cask: "homebrew/cask-versions/adoptopenjdk8"

  app "OpenRTP.app"

  caveats do
    depends_on_java "8"
  end
end
