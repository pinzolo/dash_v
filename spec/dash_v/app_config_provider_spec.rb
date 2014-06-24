require 'spec_helper'
require 'dash_v/app_config_provider'

shared_examples_for 'config of aaa' do
  describe 'application config' do
    describe '#name' do
      it 'returns "abbr_option"' do
        expect(app_config.name).to eq 'abbr_option'
      end
    end
    describe '#command' do
      it 'returns "aaa"' do
        expect(app_config.command).to eq 'aaa'
      end
    end
    describe '#option' do
      it 'returns "--version" as default option' do
        expect(app_config.option).to eq '--version'
      end
    end
    describe '#scanner' do
      it 'returns "simple" as default scanner' do
        expect(app_config.scanner).to eq 'simple'
      end
    end
  end
end

describe DashV::AppConfigProvider do
  context 'when config file is valid' do
    before do
      mock_config = {'aaa' => { 'name' => 'abbr_option', 'command' => 'aaa' },
                     'bbb' => { 'name' => 'with_option', 'command' => 'BBB', 'option' => '/v', 'scanner' => 'default'}}
      allow(DashV::ConfigLoader).to receive(:load).and_return(mock_config)
    end
    subject { DashV::AppConfigProvider.new }

    describe '#has_config?' do
      context 'when given "aaa"' do
        it 'returns true' do
          expect(subject.has_config?('aaa')).to eq true
        end
      end
      context 'when given :aaa' do
        it 'returns true' do
          expect(subject.has_config?(:aaa)).to eq true
        end
      end
      context 'when given "zzz"' do
        it 'returns false' do
          expect(subject.has_config?('zzz')).to eq false
        end
      end
    end
    describe '#get' do
      context 'when given "aaa"' do
        let(:app_config) { subject.get('aaa') }
        it_behaves_like 'config of aaa'
      end
      context 'when given :aaa' do
        let(:app_config) { subject.get(:aaa) }
        it_behaves_like 'config of aaa'
      end
      context 'when given "bbb"' do
        let(:app_config) { subject.get('bbb') }
        describe 'application config' do
          describe '#name' do
            it 'returns "with_option"' do
              expect(app_config.name).to eq 'with_option'
            end
          end
          describe '#command' do
            it 'returns "BBB"' do
              expect(app_config.command).to eq 'BBB'
            end
          end
          describe '#option' do
            it 'returns "/v"' do
              expect(app_config.option).to eq '/v'
            end
          end
          describe '#scanner' do
            it 'returns "default"' do
              expect(app_config.scanner).to eq 'default'
            end
          end
        end
      end
      context 'when give "zzz"' do
        it 'raise error' do
          expect { subject.get('zzz') }.to raise_error(DashV::UnsupportedApplicationError)
        end
      end
    end
  end
  context 'when config file contains invalid scanner' do
    before do
      mock_config = {'aaa' => { 'name' => 'abbr_option', 'command' => 'aaa', 'scanner' => 'invalid' } }
      allow(DashV::ConfigLoader).to receive(:load).and_return(mock_config)
    end
    subject { DashV::AppConfigProvider.new }

    describe '#get' do
      it 'raise error' do
        expect { subject.get('aaa') }.to raise_error(DashV::InvalidConfigurationError)
      end
    end
  end
end
