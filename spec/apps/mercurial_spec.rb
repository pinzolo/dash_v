require 'spec_helper'

describe 'Mercurial' do
  it 'supported mercurial' do
    expect(Dashv.supported?(:mercurial)).to eq true
  end
  it 'supported hg' do
    expect(Dashv.supported?(:hg)).to eq true
  end
  it 'supported subversion too' do
    expect(Dashv.supported?('subversion')).to eq true
  end
  context 'when version is 2.2.2 on debian' do
    before do
      stub_invoke <<-_EOS_
Mercurial Distributed SCM (version 2.2.2)
(see http://mercurial.selenic.com for more information)

Copyright (C) 2005-2012 Matt Mackall and others
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
      _EOS_
    end
    it 'returns version 2.2.2' do
      expect(Dashv['hg'].version).to eq '2.2.2'
    end
  end
  context 'when version is 3.0.1 on Max OS X' do
    before do
      stub_invoke <<-_EOS_
Mercurial Distributed SCM (version 3.0.1)
(see http://mercurial.selenic.com for more information)

Copyright (C) 2005-2014 Matt Mackall and others
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
      _EOS_
    end
    it 'returns version 3.0.1' do
      expect(Dashv[:mercurial].version).to eq '3.0.1'
    end
  end
end

