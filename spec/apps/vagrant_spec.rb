require 'spec_helper'

describe 'Vagrant' do
  it 'supported' do
    expect(Dashv.supported?(:vagrant)).to eq true
  end
  context 'when Vagrant version is 1.5.3' do
    before do
      stub_invoke('Vagrant 1.5.3')
    end
    it 'returns version 1.5.3' do
      expect(Dashv[:vagrant].version).to eq '1.5.3'
    end
  end
end

