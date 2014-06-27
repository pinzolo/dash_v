require 'spec_helper'

describe 'java' do
  it 'supported' do
    expect(Dashv.supported?(:java)).to eq true
  end
  context 'when version is 1.6.0_p65 on Max OS X' do
    before do
      stub_invoke <<-_EOS_
java version "1.6.0_65"
Java(TM) SE Runtime Environment (build 1.6.0_65-b14-462-11M4609)
Java HotSpot(TM) 64-Bit Server VM (build 20.65-b04-462, mixed mode)
      _EOS_
    end
    it 'returns version 1.6.0p65' do
      expect(Dashv['java'].version).to eq '1.6.0p65'
    end
  end
  context 'when version is 1.7.0_60 on Ubuntu Server 12.04' do
    before do
      stub_invoke <<-_EOS_
java version "1.7.0_60"
Java(TM) SE Runtime Environment (build 1.7.0_60-b19)
Java HotSpot(TM) 64-Bit Server VM (build 24.60-b09, mixed mode)
      _EOS_
    end
    it 'returns version 1.7.0_60' do
      expect(Dashv[:java].version).to eq '1.7.0p60'
    end
  end
end
