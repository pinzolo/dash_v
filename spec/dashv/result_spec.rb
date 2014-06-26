require 'spec_helper'

describe Dashv::Result do
  before do
    mock_config = Dashv::AppConfig.new('key' =>'aaa', 'name' => 'abbr_option', 'command' => 'aaa', 'scanner' => 'qualified_simple')
    allow(Dashv).to receive(:app_config_provider).and_return(double(get: mock_config))
  end
  context 'when command succeeded' do
    before do
      stub_invoke('aaa is test command (version 1.2.3)')
    end
    subject { Dashv['aaa'] }
    describe '#version' do
      it 'returns Dashv::Version' do
        expect(subject.version).to be_a Dashv::Version
      end
      it 'returns 1.2.3' do
        expect(subject.version).to eq '1.2.3'
      end
    end
    describe '#success?' do
      it 'returns true' do
        expect(subject.success?).to eq true
      end
    end
    describe '#failure?' do
      it 'returns false' do
        expect(subject.failure?).to eq false
      end
    end
    describe '#exit_code' do
      it 'returns 0' do
        expect(subject.exit_code).to eq 0
      end
    end
    describe '#pid' do
      it 'returns value' do
        expect(subject.pid).not_to be_nil
      end
    end
    describe '#full_output' do
      it 'returns "aaa is test command (version 1.2.3)"' do
        expect(subject.full_output).to eq 'aaa is test command (version 1.2.3)'
      end
    end
  end
  context 'when command failed' do
    subject { Dashv['aaa'] }
    describe '#version' do
      it 'returns nil' do
        expect(subject.version).to be_nil
      end
    end
    describe '#success?' do
      it 'returns false' do
        expect(subject.success?).to eq false
      end
    end
    describe '#failure?' do
      it 'returns true' do
        expect(subject.failure?).to eq true
      end
    end
    describe '#exit_code' do
      it 'returns not 0' do
        expect(subject.exit_code).not_to eq 0
      end
    end
    describe '#pid' do
      it 'returns value' do
        expect(subject.pid).not_to be_nil
      end
    end
    describe '#full_output' do
      it 'returns output that `aaa` executed' do
        expect(subject.full_output).not_to be_nil
      end
    end
  end
end
