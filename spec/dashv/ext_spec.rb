require 'spec_helper'

describe 'Dashv::Ext' do
  before(:all) { Dashv.extend_to_core! }
  context 'when included' do
    before do
      mock_config = Dashv::AppConfig.new('key' =>'aaa', 'name' => 'abbr_option', 'command' => 'aaa', 'scanner' => 'qualified_simple')
      allow(Dashv).to receive(:app_config_provider).and_return(double(get: mock_config))
      stub_invoke('aaa is test command (version 1.2.3)')
    end
    describe String do
      describe '#dashv' do
        it 'respond_to :dashv' do
          expect('foo').to respond_to :dashv
        end
        it 'works' do
          expect('aaa'.dashv.version).to eq '1.2.3'
        end
      end
    end
    describe Symbol do
      describe '#dashv' do
        it 'respond_to :dashv' do
          expect(:bar).to respond_to :dashv
        end
        it 'works' do
          expect(:aaa.dashv.version).to eq '1.2.3'
        end
      end
    end
  end
end
