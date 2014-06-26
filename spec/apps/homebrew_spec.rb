require 'spec_helper'

describe 'Homebrew' do
  it 'supported brew' do
    expect(Dashv.supported?(:brew)).to eq true
  end
  it 'supported homebrew' do
    expect(Dashv.supported?('homebrew')).to eq true
  end
  context 'when version is 0.9.5' do
    before do
      stub_invoke('0.9.5')
    end
    it 'returns version 0.9.5' do
      expect(Dashv['brew'].version).to eq '0.9.5'
    end
  end
end

