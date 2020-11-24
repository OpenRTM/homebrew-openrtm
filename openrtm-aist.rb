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

  depends_on "openrtm/omniorb/omniorb-ssl"
  depends_on "boost"

  bottle do
    root_url "https://github.com/OpenRTM/homebrew-openrtm/releases/download/1.2.2/"
    cellar :any
    sha256 "e35949fe8ae1c456b0d6faa04700895c3d4029e452eab0c08964bda74af0eb90" => :catalina
  end

  patch do
    url "https://raw.githubusercontent.com/OpenRTM/homebrew-openrtm/master/Patches/rtm-naming.diff"
    sha256 "3a89f3ad048ab0693de8ae9fd3d1b8502b5b57f612926322de769eb6aebdb8df"
  end

  def install
    args = %W[
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
    system "make"
    system "make", "install"
  end

  test do
    system "rtm-config --help"
  end
end
