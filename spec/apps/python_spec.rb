require 'spec_helper'

describe 'Vagrant' do
  it 'supported' do
    expect(Dashv.supported?(:python)).to eq true
  end
  context 'when Python version is 2.7.7' do
    before do
      stub_invoke('Python 2.7.7')
    end
    it 'returns version 2.7.7' do
      expect(Dashv[:python].version).to eq '2.7.7'
    end
  end
  context 'when Python version is 3.4.1' do
    before do
      stub_invoke('Python 3.4.1')
    end
    it 'returns version 3.4.1' do
      expect(Dashv['python'].version).to eq '3.4.1'
    end
  end
end

