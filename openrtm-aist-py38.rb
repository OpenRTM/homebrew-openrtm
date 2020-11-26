#============================================================
# OpenRTM-aist formula for HomeBrew
#
# Author: Noriaki Ando <Noriaki.Ando@gmail.com>
# GitHub: https://github.com/OpenRTM/homebrew-openrtm
#
# This is the formula for omniORBpy on python3.8 (not 3.9).
# To use this formula/bottle, switch python 3.9 to python 3.8.
# $ brew unlink python3 (unlink python 3.9)
# $ brew link python@3.8
#============================================================
class OpenrtmAistPy38 < Formula
  desc "OpenRTM-aist: RT-Middleware and OMG RTC implementation in C++ implemented by AIST"
  homepage "https://openrtm.org"
  url "https://github.com/OpenRTM/OpenRTM-aist/releases/download/v1.2.2/OpenRTM-aist-1.2.2.tar.gz"
  sha256 "4e25b0e38d9b6690b94e1163285ea8b49aef6b245a2c454586915d425e5830a0"
  license "LGPL-2.1"

  depends_on "openrtm/omniorb/omniorb-ssl-py38"
  depends_on "boost"

  bottle do
    root_url "https://github.com/OpenRTM/homebrew-openrtm/releases/download/1.2.2/"
    cellar :any
    sha256 "1bf6d956dd58787a282201e841428041e8467ac2fdc4cf1fdced72a57523dc74" => :catalina
  end
  
  bottle do
    root_url "https://github.com/OpenRTM/homebrew-openrtm/releases/download/1.2.2"
    cellar :any
    rebuild 1
    sha256 "7e751f843aa18db7edcab1574e1379fa6b88332294763842c42a2d0303b9dba7" => :catalina
  end


  patch do
    url "https://raw.githubusercontent.com/OpenRTM/homebrew-openrtm/master/Patches/rtm-naming.diff"
    sha256 "a41cbb5d166728ac666860e6354f7269b92c04b58c4235141080b2020be3aaca"
  end

  def install
    args = %W[
      OPENSSL_CFLAGS=-I/usr/local/opt/openssl/include
      OEPNSSL_LIBS=-L/usr/local/opt/openssl/lib
      CFLAGS=-I/usr/local/opt/python@3.8/include
      LDFLAGS=-L/usr/local/opt/python@3.8/lib
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
    system "rtm-config --help"
  end
end
