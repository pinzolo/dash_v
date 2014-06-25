require 'spec_helper'
require 'dash_v/version'

shared_examples_for 'zero version' do
  it ('major is 0') { expect(subject.major).to eq 0 }
  it ('minor is 0') { expect(subject.minor).to eq 0 }
  it ('tiny is 0' ) { expect(subject.tiny).to eq 0  }
  it ('patch is 0') { expect(subject.patch).to eq 0 }
end

shared_examples_for 'version 1.0.0p0' do
  it ('major is 1') { expect(subject.major).to eq 1 }
  it ('minor is 0') { expect(subject.minor).to eq 0 }
  it ('tiny is 0' ) { expect(subject.tiny).to eq 0  }
  it ('patch is 0') { expect(subject.patch).to eq 0 }
end

shared_examples_for 'version 1.23.0p0' do
  it ('major is 1' ) { expect(subject.major).to eq 1  }
  it ('minor is 23') { expect(subject.minor).to eq 23 }
  it ('tiny is 0'  ) { expect(subject.tiny).to eq 0   }
  it ('patch is 0' ) { expect(subject.patch).to eq 0  }
end

shared_examples_for 'version 1.23.456p0' do
  it ('major is 1' ) { expect(subject.major).to eq 1  }
  it ('minor is 23') { expect(subject.minor).to eq 23 }
  it ('tiny is 456') { expect(subject.tiny).to eq 456 }
  it ('patch is 0' ) { expect(subject.patch).to eq 0  }
end

shared_examples_for 'version 1.23.456p789' do
  it ('major is 1'  ) { expect(subject.major).to eq 1   }
  it ('minor is 23' ) { expect(subject.minor).to eq 23  }
  it ('tiny is 456' ) { expect(subject.tiny).to eq 456  }
  it ('patch is 789') { expect(subject.patch).to eq 789 }
end

describe DashV::Version do
  describe '#initialize' do
    context 'when given nil as major' do
      subject { DashV::Version.new(nil) }
      it_behaves_like 'zero version'
    end
    context 'when given number as major' do
      subject { DashV::Version.new(1) }
      it_behaves_like 'version 1.0.0p0'
    end
    context 'when given number as major and minor' do
      subject { DashV::Version.new(1, 23) }
      it_behaves_like 'version 1.23.0p0'
    end
    context 'when given number as major, minor and tiny' do
      subject { DashV::Version.new(1, 23, 456) }
      it_behaves_like 'version 1.23.456p0'
    end
    context 'when given number as major, minor, tiny and patch' do
      subject { DashV::Version.new(1, 23, 456, 789) }
      it_behaves_like 'version 1.23.456p789'
    end
    context 'when given String (ignore 2nd, 3rd, 4th arguments)' do
      context 'when given full units' do
        subject { DashV::Version.new('1.23.456p789', 99, 99, 99) }
        it_behaves_like 'version 1.23.456p789'
      end
      context 'when given major, minor and tiny' do
        subject { DashV::Version.new('1.23.456', 99, 99, 99) }
        it_behaves_like 'version 1.23.456p0'
      end
      context 'when given major and minor' do
        subject { DashV::Version.new('1.23', 99, 99, 99) }
        it_behaves_like 'version 1.23.0p0'
      end
      context 'when given major only' do
        subject { DashV::Version.new('1', 99, 99, 99) }
        it_behaves_like 'version 1.0.0p0'
      end
    end
    context 'when given Hash (ignore 2nd, 3rd, 4th arguments)' do
      context 'when given full units' do
        subject { DashV::Version.new({ major: 1, minor: 23, tiny: 456, patch: 789 }, 99, 99, 99) }
        it_behaves_like 'version 1.23.456p789'
      end
      context 'when given major, minor and tiny' do
        subject { DashV::Version.new({ major: 1, minor: 23, tiny: 456 }, 99, 99, 99) }
        it_behaves_like 'version 1.23.456p0'
      end
      context 'when given major and minor' do
        subject { DashV::Version.new({ major: 1, minor: 23 }, 99, 99, 99) }
        it_behaves_like 'version 1.23.0p0'
      end
      context 'when given major only' do
        subject { DashV::Version.new({ major: 1 }, 99, 99, 99) }
        it_behaves_like 'version 1.0.0p0'
      end
      context 'when given Hash contains Integer and String' do
        subject { DashV::Version.new({ major: 1, minor: '23', tiny: 456, patch: '789' }, 99, 99, 99) }
        it_behaves_like 'version 1.23.456p789'
      end
    end
    context 'when given nil as minor' do
      subject { DashV::Version.new(1, nil, 456, 789) }
      it 'minor is 0' do
        expect(subject.minor).to eq 0
      end
    end
    context 'when given nil as tiny' do
      subject { DashV::Version.new(1, 23, nil, 789) }
      it 'tiny is 0' do
        expect(subject.tiny).to eq 0
      end
    end
    context 'when given nil as patch' do
      subject { DashV::Version.new(1, nil, 456, nil) }
      it 'patch is 0' do
        expect(subject.patch).to eq 0
      end
    end
  end
  describe '#build' do
    subject { DashV::Version.new(1, 23, 456, 789) }
    it 'returns same value as patch' do
      expect(subject.build).to eq subject.patch
    end
  end
  describe '#simple' do
    context 'when given { major: 1, minor: 23, tiny: 456, patch: 789 }' do
      let(:version) { DashV::Version.new(1, 23, 456, 789) }
      it 'returns "1.23.456"' do
        expect(version.simple).to eq '1.23.456'
      end
    end
    context 'when given "2"' do
      let(:version) { DashV::Version.new('2') }
      it 'returns "2.0.0"' do
        expect(version.simple).to eq '2.0.0'
      end
    end
  end
  describe '#default' do
    context 'when given { major: 1, minor: 23, tiny: 456, patch: 789 }' do
      let(:version) { DashV::Version.new(1, 23, 456, 789) }
      it 'returns "1.23.456p789"' do
        expect(version.default).to eq '1.23.456p789'
      end
    end
    context 'when given "2"' do
      let(:version) { DashV::Version.new('2') }
      it 'returns "2.0.0p0"' do
        expect(version.default).to eq '2.0.0p0'
      end
    end
  end
  describe '#to_s' do
    context 'when given { major: 1, minor: 23, tiny: 456, patch: 789 }' do
      let(:version) { DashV::Version.new(1, 23, 456, 789) }
      it 'returns "1.23.456p789"' do
        binding.pry
        expect(version.to_s).to eq '1.23.456p789'
      end
    end
    context 'when given "2"' do
      let(:version) { DashV::Version.new('2') }
      it 'returns "2.0.0p0"' do
        expect(version.to_s).to eq '2.0.0p0'
      end
    end
  end
end
