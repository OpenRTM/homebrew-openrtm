#============================================================
# OpenRTM-aist-Python formula for HomeBrew
#
# Author: Noriaki Ando <Noriaki.Ando@gmail.com>
# GitHub: https://github.com/OpenRTM/homebrew-openrtm
#============================================================
class OpenrtmAistPythonPy39 < Formula
  desc "OpenRTM-aist: RT-Middleware and OMG RTC implementation in Python implemented by AIST"
  homepage "https://openrtm.org"
  url "https://github.com/OpenRTM/OpenRTM-aist-Python/releases/download/v1.2.2/OpenRTM-aist-Python-1.2.2.tar.gz"
  sha256 "88366dd5d9fefa19ba25cbf42b6d39170ffb65a1fe4c8f48222a13ddbcecfae8"
  license "LGPL-2.1"

  bottle do
    root_url "https://github.com/OpenRTM/homebrew-openrtm/releases/download/1.2.2/"
    sha256 cellar: :any_skip_relocation, catalina: "ba1e1cc7b6f9f9c8dd9dcf3907aec6127cc4333c92d363e30066434b59c790b2"
  end

  depends_on "openrtm/omniorb/omniorbpy-py38"

  def install
    comp_dir = "#{prefix}/share/openrtm-1.2/components/python3/"
    system "/usr/local/opt/python@3.9/bin/python3.9", "setup.py", "build"
    system "/usr/local/bin/python@3.9/bin/python3.9", "setup.py", "install", "--prefix=#{prefix}"
    FileUtils.chmod_R(0755, comp_dir.to_s)
  end

  test do
    system "rtcprof_python3", "--help"
  end
end
