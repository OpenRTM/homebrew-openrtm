#============================================================
# OpenRTM-aist-Python formula for HomeBrew
#
# Author: Noriaki Ando <Noriaki.Ando@gmail.com>
# GitHub: https://github.com/OpenRTM/homebrew-openrtm
#
# This is the formula for omniORBpy on python3.8 (not 3.9).
# To use this formula/bottle, switch python 3.9 to python 3.8.
# $ brew unlink python3 (unlink python 3.9)
# $ brew link python@3.8
#============================================================
class OpenrtmAistPythonPy38 < Formula
  desc "OpenRTM-aist: RT-Middleware and OMG RTC implementation in Python implemented by AIST"
  homepage "https://openrtm.org"
  url "https://github.com/OpenRTM/OpenRTM-aist-Python/releases/download/v1.2.2/OpenRTM-aist-Python-1.2.2.tar.gz"
  sha256 "88366dd5d9fefa19ba25cbf42b6d39170ffb65a1fe4c8f48222a13ddbcecfae8"
  license "LGPL-2.1"

  bottle do
    root_url "https://github.com/OpenRTM/homebrew-openrtm/releases/download/1.2.2/"
    sha256 cellar: :any, catalina: "8cf12e35e8c9d7e874a5b99f5fe060e9c9ce4195b2f9d009adfb96a71908dde0"
  end

  depends_on "openrtm/omniorb/omniorbpy-py38"

  def install
    comp_dir = "#{prefix}/share/openrtm-1.2/components/python3/"
    system "/usr/local/opt/python@3.8/bin/python3.8", "setup.py", "build"
    system "/usr/local/opt/python@3.8/bin/python3.8", "setup.py", "install", "--prefix=#{prefix}"
    FileUtils.chmod_R(0755, comp_dir.to_s)
  end

  test do
    system "rtcprof_python3", "--help"
  end
end
