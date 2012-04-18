require 'formula'

class Juju < Formula
  skip_clean :all
  url 'lp:juju', :using => :bzr
  homepage 'https://launchpad.net/ubuntu/+source/juju'
  md5 ''
  version '0.5-504'
  
  def install
    ENV.deparallelize
    ENV.no_optimization
    system "sudo","/usr/bin/easy_install","zkpython","argparse","txzookeeper","PyYAML", "txaws", "pydot","argparse"
    system "sudo","/usr/bin/python", "./setup.py", "install"
  end

  def test
    system "juju"
  end
end