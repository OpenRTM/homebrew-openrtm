#============================================================
# OpenRTM-aist formula for HomeBrew
#
# Author: Noriaki Ando <Noriaki.Ando@gmail.com>
# GitHub: https://github.com/OpenRTM/homebrew-openrtm
#============================================================
class OpenrtmAist < Formula
  desc "OpenRTM-aist meta packge"
  homepage "https://openrtm.org"
  url "https://github.com/OpenRTM/OpenRTM-aist/releases/download/v1.2.2/OpenRTM-aist-1.2.2.tar.gz"
  sha256 "4e25b0e38d9b6690b94e1163285ea8b49aef6b245a2c454586915d425e5830a0"
  license "LGPL-2.1"

  depends_on "openrtm-aist-py39"

  test do
    system "rtm-config", "--help"
  end
end
