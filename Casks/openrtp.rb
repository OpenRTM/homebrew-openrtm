#============================================================
# OpenRTP-aist cask for HomeBrew
#
# Author: Noriaki Ando <Noriaki.Ando@gmail.com>
# GitHub: https://github.com/OpenRTM/homebrew-openrtm
#============================================================
cask "openrtp" do
  version "1.2.2"
  sha256 "1c05f1dcb337b99b089203a7e3b907a65fcb48cf2a4cd676d0db4b9f31f146fb"
  
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
