# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
require 'fileutils'

class OpenrtmAistJava < Formula
  desc "OpenRTM-aist: RT-Middleware and OMG RTC implementation in C++ implemented by AIST"
  homepage "https://openrtm.org"
  url "https://github.com/OpenRTM/OpenRTM-aist-Java/releases/download/v1.2.2/OpenRTM-aist-Java-1.2.2.tar.gz"
  version "1.2.2"
  sha256 "f6cb64e746d5c1cdf894c6fa9e3b3904841fd115d0eea31da3220fc871874b5e"
  license "LGPL-2.1"

  bottle do
    root_url "https://github.com/OpenRTM/homebrew-openrtm/releases/download/1.2.2/"
    cellar :any_skip_relocation
    sha256 "4477710635162c2f0859c138b8bac6a473c6fad832968ed6305af79b053cac05" => :catalina
  end

  def install
    short_ver = "1.2"
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    Dir.chdir("jp.go.aist.rtm.RTC/jar/source/OpenRTM-aist-Java-1.2.2-jar/OpenRTM-aist/1.2") do
      system "mkdir", "-p", "#{prefix}/share/openrtm-#{short_ver}/doc/java"
      system "mkdir", "-p", "#{prefix}/share/openrtm-#{short_ver}/doc/java"
      system "cp", "-R", "JavaDoc",
             "#{prefix}/share/openrtm-#{short_ver}/doc/java"
      system "cp", "-R", "JavaDocEn",
             "#{prefix}/share/openrtm-#{short_ver}/doc/java"

      # installing jar
      system "mkdir", "-p", "#{prefix}/lib/openrtm-#{short_ver}"
      system "cp", "-R", "jar", "#{prefix}/lib/openrtm-#{short_ver}"

      # installing profile.d script into etc 
      system "mkdir", "-p", "#{prefix}/etc/profile.d"
      File.open("#{prefix}/etc/profile.d/openrtm-aist-java.sh", mode = "w"){|f|
        f.write("export RTM_JAVA_ROOT=#{prefix}/lib/openrtm-#{short_ver}")
      }
      system "chmod", "755", "#{prefix}/etc/profile.d/openrtm-aist-java.sh"

      # installing executable into bin
      system "mkdir", "-p", "#{prefix}/bin"
      system "cp", "examples/rtcd_java", "#{prefix}/bin"
      system "chmod", "755", "#{prefix}/bin/rtcd_java"
      system "cp", "examples/rtcprof_java", "#{prefix}/bin"
      system "chmod", "755", "#{prefix}/bin/rtcprof_java"

      # installing examples
      system "mkdir", "-p",
             "#{prefix}/share/openrtm-#{short_ver}/components/java"
      Dir.chdir("examples") do
        FileUtils.cp_r("RTMExamples",
                       "#{prefix}/share/openrtm-#{short_ver}/components/java/")
        Dir.glob('*.sh').each do |fname|
          FileUtils.cp(fname,
            "#{prefix}/share/openrtm-#{short_ver}/components/java/" + fname)
          system "chmod", "755",
            "#{prefix}/share/openrtm-#{short_ver}/components/java/" + fname
        end
        flist = ["original-data", "rtcd_java.conf", "search_classpath.func"]
        flist.each do |fname|
          FileUtils.cp(fname,
              "#{prefix}/share/openrtm-#{short_ver}/components/java/" + fname)
        end
      end # popdir from examples
    end # popdir from jp.go.....OpenRTM-aist/1.2
  end

  test do
    system "#{prefix}/etc/profile.d/openrtm-aist-java.sh"
  end
end
