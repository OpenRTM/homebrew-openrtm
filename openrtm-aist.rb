#============================================================
# OpenRTM-aist formula for HomeBrew
#
# Author: Noriaki Ando <Noriaki.Ando@gmail.com>
# GitHub: https://github.com/OpenRTM/homebrew-openrtm
#============================================================
class OpenrtmAist < Formula
  desc "OpenRTM-aist meta packge"
  homepage "https://openrtm.org"
  license "LGPL-2.1"

  depends_on "openrtm-aist-py39"

  def install
  end

  test do
    system "rtm-config", "--help"
  end
end
