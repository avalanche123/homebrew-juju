require 'formula'

class Juju < Formula
  skip_clean :all
  url 'https://launchpad.net/ubuntu/precise/+source/juju/0.5+bzr531-0ubuntu1/+files/juju_0.5+bzr531.orig.tar.gz'
  head 'lp:juju', :using => :bzr
  homepage 'https://launchpad.net/ubuntu/+source/juju'
  md5 '09be4a473644f3c88f64c3e29491c9af'
  version '0.5.531'
  
  depends_on 'bzr'
  depends_on 'zookeeper'

  def install
    ENV.deparallelize
    ENV.no_optimization
    system "sudo","/usr/bin/easy_install","txzookeeper","PyYAML", "txaws", "pydot","oauth"
    system "sudo","/usr/bin/python", "./setup.py", "install"
  end

  def test
    system "juju"
  end
end