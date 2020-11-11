#============================================================
# OpenRTP-aist cask for HomeBrew
#
# Author: Noriaki Ando <Noriaki.Ando@gmail.com>
# GitHub: https://github.com/OpenRTM/homebrew-openrtm
#============================================================
cask "openrtp" do
  version "1.2.2"
  sha256 "b29d93c333f02322bb919be7eb77355644860dd6bb7ed4929d32b3e3a77253a9"
  
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
