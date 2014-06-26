require 'spec_helper'

describe 'cvs' do
  it 'supported' do
    expect(Dashv.supported?(:cvs)).to eq true
  end
  context 'when git version is 1.12.13' do
    before do
      stub_invoke <<-_EOS_

Concurrent Versions System (CVS) 1.12.13 (client/server)

Copyright (C) 2005 Free Software Foundation, Inc.

Senior active maintainers include Larry Jones, Derek R. Price,
and Mark D. Baushke.  Please see the AUTHORS and README files from the CVS
distribution kit for a complete list of contributors and copyrights.

CVS may be copied only under the terms of the GNU General Public License,
a copy of which can be found with the CVS distribution kit.

Specify the --help option for further information about CVS
      _EOS_
    end
    it 'returns version 1.12.13' do
      expect(Dashv[:cvs].version).to eq '1.12.13'
    end
  end
end

