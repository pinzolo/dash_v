require 'spec_helper'

describe 'Perl' do
  it 'supported' do
    expect(Dashv.supported?(:perl)).to eq true
  end
  context 'when version is v5.16.2 with 3 registered patches on Max OS X' do
    before do
      stub_invoke <<-_EOS_

This is perl 5, version 16, subversion 2 (v5.16.2) built for darwin-thread-multi-2level
(with 3 registered patches, see perl -V for more detail)

Copyright 1987-2012, Larry Wall

Perl may be copied only under the terms of either the Artistic License or the
GNU General Public License, which may be found in the Perl 5 source kit.

Complete documentation for Perl, including FAQ lists, should be found on
this system using "man perl" or "perldoc perl".  If you have access to the
Internet, point your browser at http://www.perl.org/, the Perl Home Page.

      _EOS_
    end
    it 'returns version 5.16.2p3' do
      expect(Dashv['perl'].version).to eq '5.16.2p3'
    end
  end
  context 'when version is v5.14.2 with 57 registered patches on Ubuntu Server 12.04' do
    before do
      stub_invoke <<-_EOS_

This is perl 5, version 14, subversion 2 (v5.14.2) built for x86_64-linux-gnu-thread-multi
(with 57 registered patches, see perl -V for more detail)

Copyright 1987-2011, Larry Wall

Perl may be copied only under the terms of either the Artistic License or the
GNU General Public License, which may be found in the Perl 5 source kit.

Complete documentation for Perl, including FAQ lists, should be found on
this system using "man perl" or "perldoc perl".  If you have access to the
Internet, point your browser at http://www.perl.org/, the Perl Home Page.

      _EOS_
    end
    it 'returns version 5.14.2p57' do
      expect(Dashv[:perl].version).to eq '5.14.2p57'
    end
  end
end

