require 'spec_helper'

describe 'bazaar' do
  it 'supported bazaar' do
    expect(Dashv.supported?(:bazaar)).to eq true
  end
  it 'supported bzr' do
    expect(Dashv.supported?(:bzr)).to eq true
  end
  context 'when version is 2.4.3' do
    before do
      stub_invoke <<-_EOS_
Bazaar (bzr) 2.4.3
  Python interpreter: /usr/bin/python 2.7.5
  Python standard library: /System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7
  Platform: Darwin-13.2.0-x86_64-i386-64bit
  bzrlib: /usr/local/Cellar/bazaar/2.6.0/libexec/bzrlib
  Bazaar configuration: /Users/pinzolo/.bazaar
  Bazaar log file: /Users/pinzolo/.bzr.log

Copyright 2005-2012 Canonical Ltd.
http://bazaar.canonical.com/

bzr comes with ABSOLUTELY NO WARRANTY.  bzr is free software, and
you may use, modify and redistribute it under the terms of the GNU
General Public License version 2 or later.

Bazaar is part of the GNU Project to produce a free operating system.

      _EOS_
    end
    it 'returns version 2.4.3' do
      expect(Dashv['bzr'].version).to eq '2.4.3'
    end
  end
  context 'when version is 2.6.0dev2' do
    before do
      stub_invoke <<-_EOS_
Bazaar (bzr) 2.6.0dev2
  Python interpreter: /usr/bin/python 2.7.3
  Python standard library: /usr/lib/python2.7
  Platform: Linux-3.2.0-4-amd64-x86_64-with-debian-7.5
  bzrlib: /usr/lib/python2.7/dist-packages/bzrlib
  Bazaar configuration: /home/vagrant/.bazaar
  Bazaar log file: /home/vagrant/.bzr.log

Copyright 2005-2012 Canonical Ltd.
http://bazaar.canonical.com/

bzr comes with ABSOLUTELY NO WARRANTY.  bzr is free software, and
you may use, modify and redistribute it under the terms of the GNU
General Public License version 2 or later.

Bazaar is part of the GNU Project to produce a free operating system.

      _EOS_
    end
    it 'returns version 2.6.0p2' do
      expect(Dashv[:bazaar].version).to eq '2.6.0p2'
    end
  end
end


