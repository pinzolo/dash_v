require 'spec_helper'

describe 'Darcs' do
  it 'supported' do
    expect(Dashv.supported?(:darcs)).to eq true
  end
  context 'when version is 2.8.4 (+ 1 patch) on Max OS X' do
    before do
      stub_invoke('2.8.4 (+ 1 patch)')
    end
    it 'returns version 1.9.3' do
      expect(Dashv[:darcs].version).to eq '2.8.4p1'
    end
  end
  context 'when version is 2.8.1 (release) on Debian' do
    before do
      stub_invoke('2.8.1 (release)')
    end
    it 'returns version 2.0.0' do
      expect(Dashv['darcs'].version).to eq '2.8.1'
    end
  end
end

