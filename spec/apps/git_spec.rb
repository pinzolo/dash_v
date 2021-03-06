require 'spec_helper'

describe 'git' do
  it 'supported' do
    expect(Dashv.supported?(:git)).to eq true
  end
  context 'when git version is 1.9.3' do
    before do
      stub_invoke('git version 1.9.3')
    end
    it 'returns version 1.9.3' do
      expect(Dashv[:git].version).to eq '1.9.3'
    end
  end
  context 'when git version is 2.0.0' do
    before do
      stub_invoke('git version 2.0.0')
    end
    it 'returns version 2.0.0' do
      expect(Dashv['git'].version).to eq '2.0.0'
    end
  end
end
