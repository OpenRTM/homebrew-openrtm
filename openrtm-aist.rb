#============================================================
# OpenRTM-aist formula for HomeBrew
#
# Author: Noriaki Ando <Noriaki.Ando@gmail.com>
# GitHub: https://github.com/OpenRTM/homebrew-openrtm
#============================================================
class OpenrtmAist < Formula
  desc "OpenRTM-aist: RT-Middleware and OMG RTC implementation in C++ implemented by AIST"
  homepage "https://openrtm.org"
  url "https://github.com/OpenRTM/OpenRTM-aist/releases/download/v1.2.2/OpenRTM-aist-1.2.2.tar.gz"
  sha256 "4e25b0e38d9b6690b94e1163285ea8b49aef6b245a2c454586915d425e5830a0"
  license "LGPL-2.1"

  bottle do
    root_url "https://github.com/OpenRTM/homebrew-openrtm/releases/download/1.2.2"
    rebuild 2
    sha256 cellar: :any, catalina: "040affa6c93010bcdfa7308936bd0be7dea0fcac5074fa350d23c6a16199be40"
  end

  depends_on "boost"

  depends_on "openrtm/omniorb/omniorb-ssl"

  patch do
    url "https://raw.githubusercontent.com/OpenRTM/homebrew-openrtm/master/Patches/rtm-naming.diff"
    sha256 "a41cbb5d166728ac666860e6354f7269b92c04b58c4235141080b2020be3aaca"
  end

  def install
    args = %w[
      OPENSSL_CFLAGS=-I/usr/local/opt/openssl/include
      OEPNSSL_LIBS=-L/usr/local/opt/openssl/lib
      CC=gcc-4.9
      CXX=g++-4.9
    ]
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
