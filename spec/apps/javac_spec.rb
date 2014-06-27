require 'spec_helper'

describe 'javac' do
  it 'supported' do
    expect(Dashv.supported?(:javac)).to eq true
  end
  context 'when version is 1.6.0_p65 on Max OS X' do
    before { stub_invoke('javac 1.6.0_65') }
    it 'returns version 1.6.0p65' do
      expect(Dashv['javac'].version).to eq '1.6.0p65'
    end
  end
  context 'when version is 1.7.0_60 on Ubuntu Server 12.04' do
    before { stub_invoke('javac 1.7.0_60') }
    it 'returns version 1.7.0p60' do
      expect(Dashv[:javac].version).to eq '1.7.0p60'
    end
  end
end

