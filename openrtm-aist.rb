#============================================================
# OpenRTM-aist formula for HomeBrew
#
# Author: Noriaki Ando <Noriaki.Ando@gmail.com>
# GitHub: https://github.com/OpenRTM/homebrew-openrtm
#
# This is the formula for OpenRTM-aist (C++) for python3.9.
# To use this formula/bottle, switch python into python 3.9.
# $ brew unlink python3 (unlink python 3.X != 3.9)
# $ brew link python@3.9
#============================================================
class OpenrtmAist < Formula
  desc "OpenRTM-aist: RT-Middleware and OMG RTC implementation in C++ implemented by AIST"
  homepage "https://openrtm.org"
  url "https://github.com/OpenRTM/OpenRTM-aist/releases/download/v1.2.2/OpenRTM-aist-1.2.2.tar.gz"
  sha256 "4e25b0e38d9b6690b94e1163285ea8b49aef6b245a2c454586915d425e5830a0"
  license "LGPL-2.1"

  bottle do
    root_url "https://github.com/OpenRTM/homebrew-openrtm/releases/download/1.2.2"
    rebuild 3
    sha256 cellar: :any, catalina: "ddcb03986ec249dbefec78ef4959f599ce73a6f773c710620f95c3bdf001fe3c"
  end

  depends_on "boost"
  depends_on "openrtm/omniorb/omniorb-ssl"

  patch do
    url "https://raw.githubusercontent.com/OpenRTM/homebrew-openrtm/master/Patches/rtm-naming.diff"
    sha256 "a41cbb5d166728ac666860e6354f7269b92c04b58c4235141080b2020be3aaca"
  end

  def install
    system "./configure", "--without-doxygen",
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "-j", "8"
    system "make", "install"
  end

  test do
    system "rtm-config", "--help"
  end
end
