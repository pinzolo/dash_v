require 'spec_helper'
require 'dash_v/scanners/simple_scanner'

describe DashV::Scanners::SimpleScanner do
  let(:scanner) { DashV::Scanners::SimpleScanner.new }
  describe '#scan' do
    context 'when given nil' do
      it 'returns nil' do
        expect(scanner.scan(nil)).to be_nil
      end
    end
    context 'when given empty' do
      it 'returns nil' do
        expect(scanner.scan('')).to be_nil
      end
    end
    context 'when given blank' do
      it 'returns nil' do
        expect(scanner.scan('   ')).to be_nil
      end
    end
    context 'when given text that starts not a number' do
      it 'returns nil' do
        expect(scanner.scan('abc.1.2')).to be_nil
      end
    end
    context 'when given text that contains not a number' do
      it 'returns nil' do
        expect(scanner.scan('1.xxx.2')).to be_nil
      end
    end
    context 'when given text that ends not a number' do
      it 'returns nil' do
        expect(scanner.scan('1.2.xyz')).to be_nil
      end
    end
    context 'when given "3"' do
      let(:result) { scanner.scan('3') }
      it 'returns Hash' do
        expect(result).to be_a Hash
      end
      it 'returns 3 as major' do
        expect(result[:major]).to eq '3'
      end
      it 'returns nil as minor' do
        expect(result[:minor]).to be_nil
      end
      it 'returns nil as tiny' do
        expect(result[:tiny]).to be_nil
      end
      it 'returns nil as patch' do
        expect(result[:patch]).to be_nil
      end
    end
    context 'when given "1.12"' do
      let(:result) { scanner.scan('1.12') }
      it 'returns Hash' do
        expect(result).to be_a Hash
      end
      it 'returns "1" as major' do
        expect(result[:major]).to eq '1'
      end
      it 'returns "12" as minor' do
        expect(result[:minor]).to eq '12'
      end
      it 'returns nil as tiny' do
        expect(result[:tiny]).to be_nil
      end
      it 'returns nil as patch' do
        expect(result[:patch]).to be_nil
      end
    end
    context 'when given "1.23.456"' do
      let(:result) { scanner.scan('1.23.456') }
      it 'returns Hash' do
        expect(result).to be_a Hash
      end
      it 'returns "1" as major' do
        expect(result[:major]).to eq '1'
      end
      it 'returns "23" as minor' do
        expect(result[:minor]).to eq '23'
      end
      it 'returns "456" as tiny' do
        expect(result[:tiny]).to eq '456'
      end
    end
    context 'when given "1.23.456p789"' do
      let(:result) { scanner.scan('1.23.456p789') }
      it 'returns nil' do
        expect(result).to be_nil
      end
    end
  end
end
