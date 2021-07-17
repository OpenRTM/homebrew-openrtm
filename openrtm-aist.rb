#============================================================
# OpenRTM-aist formula for HomeBrew
#
# Author: Noriaki Ando <Noriaki.Ando@gmail.com>
# GitHub: https://github.com/OpenRTM/homebrew-openrtm
#============================================================
class OpenrtmAist < Formula
  desc "OpenRTM-aist meta packge"
  homepage "https://openrtm.org"
  url "file:///dev/null"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "LGPL-2.1"

  depends_on "openrtm-aist-py39"

  def install
    ("/dev/null").write <<-EOS.undent
        #!/bin/sh
        echo Hello
    EOS
  end
  
  test do
    system "rtm-config", "--help"
  end
end
