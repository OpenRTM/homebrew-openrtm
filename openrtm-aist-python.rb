# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class OpenrtmAistPython < Formula
  desc "OpenRTM-aist: RT-Middleware and OMG RTC implementation in Python implemented by AIST"
  homepage ""
  url "https://github.com/OpenRTM/OpenRTM-aist-Python/releases/download/v1.2.2/OpenRTM-aist-Python-1.2.2.tar.gz"
  sha256 "88366dd5d9fefa19ba25cbf42b6d39170ffb65a1fe4c8f48222a13ddbcecfae8"
  license "NOASSERTION"

  # depends_on "cmake" => :build
    depends_on "omniorb"
    depends_on "openssl"

  def install
    system "/usr/local/bin/python3", "setup.py", "build"
    system "/usr/local/bin/python3", "setup.py", "install"
  end

  test do
    system "false"
  end
end
