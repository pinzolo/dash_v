require 'spec_helper'
require 'dashv/scanners/git_scanner'

describe Dashv::Scanners::GitScanner do
  subject { Dashv::Scanners::GitScanner.new }
  describe '#scan' do
    context 'when given git version 1.9.3' do
      let(:result) { subject.scan('git version 1.9.3') }
      it 'returns Hash' do
        expect(result).to be_a Hash
      end
      it 'returns 1 as major' do
        expect(result[:major]).to eq '1'
      end
      it 'returns 9 as minor' do
        expect(result[:minor]).to eq '9'
      end
      it 'returns 3 as tiny' do
        expect(result[:tiny]).to eq '3'
      end
      it 'returns nil as patch' do
        expect(result[:patch]).to be_nil
      end
    end
    context 'when given git version 2.0.0' do
      let(:result) { subject.scan('git version 2.0.0') }
      it 'returns Hash' do
        expect(result).to be_a Hash
      end
      it 'returns 2 as major' do
        expect(result[:major]).to eq '2'
      end
      it 'returns 0 as minor' do
        expect(result[:minor]).to eq '0'
      end
      it 'returns 0 as tiny' do
        expect(result[:tiny]).to eq '0'
      end
      it 'returns nil as patch' do
        expect(result[:patch]).to be_nil
      end
    end
  end
end
