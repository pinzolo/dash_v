require 'spec_helper'
require 'dashv/version'

describe Dashv::Version do
  subject { Dashv::Version.new(1, 23, 456, 789) }

  describe '>' do# {{{
    context 'when other is a Dashv::Version' do
      context 'when other is 1.0.0p0' do
        it 'returns true' do
          expect(subject > Dashv::Version.new(1)).to eq true
        end
      end
      context 'when other is 2.0.0p0' do
        it 'returns false' do
          expect(subject > Dashv::Version.new(2)).to eq false
        end
      end
      context 'when other is 1.23.0p0' do
        it 'returns true' do
          expect(subject > Dashv::Version.new(1, 23)).to eq true
        end
      end
      context 'when other is 1.24.0p0' do
        it 'returns false' do
          expect(subject > Dashv::Version.new(1, 24)).to eq false
        end
      end
      context 'when other is 1.23.456p0' do
        it 'returns true' do
          expect(subject > Dashv::Version.new(1, 23, 456)).to eq true
        end
      end
      context 'when other is 1.23.457p0' do
        it 'returns false' do
          expect(subject > Dashv::Version.new(1, 23, 457)).to eq false
        end
      end
      context 'when other is 1.23.456p788' do
        it 'returns true' do
          expect(subject > Dashv::Version.new(1, 23, 456, 788)).to eq true
        end
      end
      context 'when other is 1.23.456p789' do
        it 'returns false' do
          expect(subject > Dashv::Version.new(1, 23, 456, 789)).to eq false
        end
      end
      context 'when other is 1.23.456p790' do
        it 'returns false' do
          expect(subject > Dashv::Version.new(1, 23, 456, 790)).to eq false
        end
      end
    end
    context 'when other is a String' do
      context 'when other is 1.0.0p0' do
        it 'returns true' do
          expect(subject > '1').to eq true
        end
      end
      context 'when other is 2.0.0p0' do
        it 'returns false' do
          expect(subject > '2').to eq false
        end
      end
      context 'when other is 1.23.0p0' do
        it 'returns true' do
          expect(subject > '1.23').to eq true
        end
      end
      context 'when other is 1.24.0p0' do
        it 'returns false' do
          expect(subject > '1.24').to eq false
        end
      end
      context 'when other is 1.23.456p0' do
        it 'returns true' do
          expect(subject > '1.23.456').to eq true
        end
      end
      context 'when other is 1.23.457p0' do
        it 'returns false' do
          expect(subject > '1.23.457').to eq false
        end
      end
      context 'when other is 1.23.456p788' do
        it 'returns true' do
          expect(subject > '1.23.456p788').to eq true
        end
      end
      context 'when other is 1.23.456p789' do
        it 'returns false' do
          expect(subject > '1.23.456p789').to eq false
        end
      end
      context 'when other is 1.23.456p790' do
        it 'returns false' do
          expect(subject > '1.23.456p790').to eq false
        end
      end
    end
  end# }}}

  describe '>=' do# {{{
    context 'when other is a Dashv::Version' do
      context 'when other is 1.0.0p0' do
        it 'returns true' do
          expect(subject >= Dashv::Version.new(1)).to eq true
        end
      end
      context 'when other is 2.0.0p0' do
        it 'returns false' do
          expect(subject >= Dashv::Version.new(2)).to eq false
        end
      end
      context 'when other is 1.23.0p0' do
        it 'returns true' do
          expect(subject >= Dashv::Version.new(1, 23)).to eq true
        end
      end
      context 'when other is 1.24.0p0' do
        it 'returns false' do
          expect(subject >= Dashv::Version.new(1, 24)).to eq false
        end
      end
      context 'when other is 1.23.456p0' do
        it 'returns true' do
          expect(subject >= Dashv::Version.new(1, 23, 456)).to eq true
        end
      end
      context 'when other is 1.23.457p0' do
        it 'returns false' do
          expect(subject >= Dashv::Version.new(1, 23, 457)).to eq false
        end
      end
      context 'when other is 1.23.456p788' do
        it 'returns true' do
          expect(subject >= Dashv::Version.new(1, 23, 456, 788)).to eq true
        end
      end
      context 'when other is 1.23.456p789' do
        it 'returns true' do
          expect(subject >= Dashv::Version.new(1, 23, 456, 789)).to eq true
        end
      end
      context 'when other is 1.23.456p790' do
        it 'returns false' do
          expect(subject >= Dashv::Version.new(1, 23, 456, 790)).to eq false
        end
      end
    end
    context 'when other is a String' do
      context 'when other is 1.0.0p0' do
        it 'returns true' do
          expect(subject >= '1').to eq true
        end
      end
      context 'when other is 2.0.0p0' do
        it 'returns false' do
          expect(subject >= '2').to eq false
        end
      end
      context 'when other is 1.23.0p0' do
        it 'returns true' do
          expect(subject >= '1.23').to eq true
        end
      end
      context 'when other is 1.24.0p0' do
        it 'returns false' do
          expect(subject >= '1.24').to eq false
        end
      end
      context 'when other is 1.23.456p0' do
        it 'returns true' do
          expect(subject >= '1.23.456').to eq true
        end
      end
      context 'when other is 1.23.457p0' do
        it 'returns false' do
          expect(subject >= '1.23.457').to eq false
        end
      end
      context 'when other is 1.23.456p788' do
        it 'returns true' do
          expect(subject >= '1.23.456p788').to eq true
        end
      end
      context 'when other is 1.23.456p789' do
        it 'returns true' do
          expect(subject >= '1.23.456p789').to eq true
        end
      end
      context 'when other is 1.23.456p790' do
        it 'returns false' do
          expect(subject >= '1.23.456p790').to eq false
        end
      end
    end
  end# }}}

  describe '<' do# {{{
    context 'when other is a Dashv::Version' do
      context 'when other is 1.0.0p0' do
        it 'returns false' do
          expect(subject < Dashv::Version.new(1)).to eq false
        end
      end
      context 'when other is 2.0.0p0' do
        it 'returns true' do
          expect(subject < Dashv::Version.new(2)).to eq true
        end
      end
      context 'when other is 1.23.0p0' do
        it 'returns false' do
          expect(subject < Dashv::Version.new(1, 23)).to eq false
        end
      end
      context 'when other is 1.24.0p0' do
        it 'returns true' do
          expect(subject < Dashv::Version.new(1, 24)).to eq true
        end
      end
      context 'when other is 1.23.456p0' do
        it 'returns false' do
          expect(subject < Dashv::Version.new(1, 23, 456)).to eq false
        end
      end
      context 'when other is 1.23.457p0' do
        it 'returns true' do
          expect(subject < Dashv::Version.new(1, 23, 457)).to eq true
        end
      end
      context 'when other is 1.23.456p788' do
        it 'returns false' do
          expect(subject < Dashv::Version.new(1, 23, 456, 788)).to eq false
        end
      end
      context 'when other is 1.23.456p789' do
        it 'returns false' do
          expect(subject < Dashv::Version.new(1, 23, 456, 789)).to eq false
        end
      end
      context 'when other is 1.23.456p790' do
        it 'returns true' do
          expect(subject < Dashv::Version.new(1, 23, 456, 790)).to eq true
        end
      end
    end
    context 'when other is a String' do
      context 'when other is 1.0.0p0' do
        it 'returns false' do
          expect(subject < '1').to eq false
        end
      end
      context 'when other is 2.0.0p0' do
        it 'returns true' do
          expect(subject < '2').to eq true
        end
      end
      context 'when other is 1.23.0p0' do
        it 'returns false' do
          expect(subject < '1.23').to eq false
        end
      end
      context 'when other is 1.24.0p0' do
        it 'returns true' do
          expect(subject < '1.24').to eq true
        end
      end
      context 'when other is 1.23.456p0' do
        it 'returns false' do
          expect(subject < '1.23.456').to eq false
        end
      end
      context 'when other is 1.23.457p0' do
        it 'returns true' do
          expect(subject < '1.23.457').to eq true
        end
      end
      context 'when other is 1.23.456p788' do
        it 'returns false' do
          expect(subject < '1.23.456p788').to eq false
        end
      end
      context 'when other is 1.23.456p789' do
        it 'returns false' do
          expect(subject < '1.23.456p789').to eq false
        end
      end
      context 'when other is 1.23.456p790' do
        it 'returns true' do
          expect(subject < '1.23.456p790').to eq true
        end
      end
    end
  end# }}}

  describe '<=' do# {{{
    context 'when other is a Dashv::Version' do
      context 'when other is 1.0.0p0' do
        it 'returns false' do
          expect(subject <= Dashv::Version.new(1)).to eq false
        end
      end
      context 'when other is 2.0.0p0' do
        it 'returns true' do
          expect(subject <= Dashv::Version.new(2)).to eq true
        end
      end
      context 'when other is 1.23.0p0' do
        it 'returns false' do
          expect(subject <= Dashv::Version.new(1, 23)).to eq false
        end
      end
      context 'when other is 1.24.0p0' do
        it 'returns true' do
          expect(subject <= Dashv::Version.new(1, 24)).to eq true
        end
      end
      context 'when other is 1.23.456p0' do
        it 'returns false' do
          expect(subject <= Dashv::Version.new(1, 23, 456)).to eq false
        end
      end
      context 'when other is 1.23.457p0' do
        it 'returns true' do
          expect(subject <= Dashv::Version.new(1, 23, 457)).to eq true
        end
      end
      context 'when other is 1.23.456p788' do
        it 'returns false' do
          expect(subject <= Dashv::Version.new(1, 23, 456, 788)).to eq false
        end
      end
      context 'when other is 1.23.456p789' do
        it 'returns true' do
          expect(subject <= Dashv::Version.new(1, 23, 456, 789)).to eq true
        end
      end
      context 'when other is 1.23.456p790' do
        it 'returns true' do
          expect(subject <= Dashv::Version.new(1, 23, 456, 790)).to eq true
        end
      end
    end
    context 'when other is a String' do
      context 'when other is 1.0.0p0' do
        it 'returns false' do
          expect(subject <= '1').to eq false
        end
      end
      context 'when other is 2.0.0p0' do
        it 'returns true' do
          expect(subject <= '2').to eq true
        end
      end
      context 'when other is 1.23.0p0' do
        it 'returns false' do
          expect(subject <= '1.23').to eq false
        end
      end
      context 'when other is 1.24.0p0' do
        it 'returns true' do
          expect(subject <= '1.24').to eq true
        end
      end
      context 'when other is 1.23.456p0' do
        it 'returns false' do
          expect(subject <= '1.23.456').to eq false
        end
      end
      context 'when other is 1.23.457p0' do
        it 'returns true' do
          expect(subject <= '1.23.457').to eq true
        end
      end
      context 'when other is 1.23.456p788' do
        it 'returns false' do
          expect(subject <= '1.23.456p788').to eq false
        end
      end
      context 'when other is 1.23.456p789' do
        it 'returns true' do
          expect(subject <= '1.23.456p789').to eq true
        end
      end
      context 'when other is 1.23.456p790' do
        it 'returns true' do
          expect(subject <= '1.23.456p790').to eq true
        end
      end
    end
  end# }}}

  describe '==' do# {{{
    subject { Dashv::Version.new(1, 23, 456, 789) }
    context 'when other is a Dashv::Version' do
      context 'when other is 1.0.0p0' do
        it 'returns false' do
          expect(subject == Dashv::Version.new(1)).to eq false
        end
      end
      context 'when other is 2.0.0p0' do
        it 'returns false' do
          expect(subject == Dashv::Version.new(2)).to eq false
        end
      end
      context 'when other is 1.23.0p0' do
        it 'returns false' do
          expect(subject == Dashv::Version.new(1, 23)).to eq false
        end
      end
      context 'when other is 1.24.0p0' do
        it 'returns false' do
          expect(subject == Dashv::Version.new(1, 24)).to eq false
        end
      end
      context 'when other is 1.23.456p0' do
        it 'returns false' do
          expect(subject == Dashv::Version.new(1, 23, 456)).to eq false
        end
      end
      context 'when other is 1.23.457p0' do
        it 'returns false' do
          expect(subject == Dashv::Version.new(1, 23, 457)).to eq false
        end
      end
      context 'when other is 1.23.456p788' do
        it 'returns false' do
          expect(subject == Dashv::Version.new(1, 23, 456, 788)).to eq false
        end
      end
      context 'when other is 1.23.456p789' do
        it 'returns true' do
          expect(subject == Dashv::Version.new(1, 23, 456, 789)).to eq true
        end
      end
      context 'when other is 1.23.456p790' do
        it 'returns false' do
          expect(subject == Dashv::Version.new(1, 23, 456, 790)).to eq false
        end
      end
    end
    context 'when other is a String' do
      context 'when other is 1.0.0p0' do
        it 'returns false' do
          expect(subject == '1').to eq false
        end
      end
      context 'when other is 2.0.0p0' do
        it 'returns false' do
          expect(subject == '2').to eq false
        end
      end
      context 'when other is 1.23.0p0' do
        it 'returns false' do
          expect(subject == '1.23').to eq false
        end
      end
      context 'when other is 1.24.0p0' do
        it 'returns false' do
          expect(subject == '1.24').to eq false
        end
      end
      context 'when other is 1.23.456p0' do
        it 'returns false' do
          expect(subject == '1.23.456').to eq false
        end
      end
      context 'when other is 1.23.457p0' do
        it 'returns false' do
          expect(subject == '1.23.457').to eq false
        end
      end
      context 'when other is 1.23.456p788' do
        it 'returns false' do
          expect(subject == '1.23.456p788').to eq false
        end
      end
      context 'when other is 1.23.456p789' do
        it 'returns true' do
          expect(subject == '1.23.456p789').to eq true
        end
      end
      context 'when other is 1.23.456p790' do
        it 'returns false' do
          expect(subject == '1.23.456p790').to eq false
        end
      end
    end
  end# }}}

  describe '#tilde_greater_than?' do# {{{
    context 'when given invalid string as version' do
      it 'returns false' do
        version = Dashv::Version.new(1, 2, 3)
        expect(version.tilde_greater_than?('foo.bar.baz')).to eq false
      end
    end
    context 'when given 1.23.5' do
      context 'when version is 0.22.5' do
        it 'returns false' do
          version = Dashv::Version.new(0, 22, 5)
          expect(version.tilde_greater_than?('1.23.5')).to eq false
        end
      end
      context 'when version is 1.22.5' do
        it 'returns false' do
          version = Dashv::Version.new(1, 22, 5)
          expect(version.tilde_greater_than?('1.23.5')).to eq false
        end
      end
      context 'when version is 1.23.4' do
        it 'returns false' do
          version = Dashv::Version.new(1, 23, 0)
          expect(version.tilde_greater_than?('1.23.5')).to eq false
        end
      end
      context 'when version is 1.23.5' do
        it 'returns true' do
          version = Dashv::Version.new(1, 23, 5)
          expect(version.tilde_greater_than?('1.23.5')).to eq true
        end
      end
      context 'when version is 1.24.0' do
        it 'returns false' do
          version = Dashv::Version.new(1, 24, 0)
          expect(version.tilde_greater_than?('1.23.5')).to eq false
        end
      end
      context 'when version is 2.0.0' do
        it 'returns false' do
          version = Dashv::Version.new(2)
          expect(version.tilde_greater_than?('1.23.5')).to eq false
        end
      end
    end
    context 'when given 1.5' do
      context 'when version is 0.5.5' do
        it 'returns false' do
          version = Dashv::Version.new(0, 5, 5)
          expect(version.tilde_greater_than?('1.5')).to eq false
        end
      end
      context 'when version is 1.4.5' do
        it 'returns false' do
          version = Dashv::Version.new(1, 4, 5)
          expect(version.tilde_greater_than?('1.5')).to eq false
        end
      end
      context 'when version is 1.5.0' do
        it 'returns true' do
          version = Dashv::Version.new(1, 5, 0)
          expect(version.tilde_greater_than?('1.5')).to eq true
        end
      end
      context 'when version is 1.5.1' do
        it 'returns true' do
          version = Dashv::Version.new(1, 5, 1)
          expect(version.tilde_greater_than?('1.5')).to eq true
        end
      end
      context 'when version is 1.24.0' do
        it 'returns true' do
          version = Dashv::Version.new(1, 24, 0)
          expect(version.tilde_greater_than?('1.5')).to eq true
        end
      end
      context 'when version is 2.0.0' do
        it 'returns false' do
          version = Dashv::Version.new(2)
          expect(version.tilde_greater_than?('1.5')).to eq false
        end
      end
    end
    context 'when given 1' do
      context 'when version is 0.9.5' do
        it 'returns false' do
          version = Dashv::Version.new(0, 9, 5)
          expect(version.tilde_greater_than?('1')).to eq false
        end
      end
      context 'when version is 1.0.0' do
        it 'returns true' do
          version = Dashv::Version.new(1, 0, 0)
          expect(version.tilde_greater_than?('1')).to eq true
        end
      end
      context 'when version is 1.0.5' do
        it 'returns true' do
          version = Dashv::Version.new(1, 0, 5)
          expect(version.tilde_greater_than?('1')).to eq true
        end
      end
      context 'when version is 1.99.5' do
        it 'returns true' do
          version = Dashv::Version.new(1, 99, 5)
          expect(version.tilde_greater_than?('1')).to eq true
        end
      end
      context 'when version is 2.0.0' do
        it 'returns true' do
          version = Dashv::Version.new(2)
          expect(version.tilde_greater_than?('1')).to eq true
        end
      end
    end
  end# }}}

  describe '#tgt?' do# {{{
    context 'when given invalid string as version' do
      it 'returns false' do
        version = Dashv::Version.new(1, 2, 3)
        expect(version.tgt?('foo.bar.baz')).to eq false
      end
    end
    context 'when given 1.23.5' do
      context 'when version is 0.22.5' do
        it 'returns false' do
          version = Dashv::Version.new(0, 22, 5)
          expect(version.tgt?('1.23.5')).to eq false
        end
      end
      context 'when version is 1.22.5' do
        it 'returns false' do
          version = Dashv::Version.new(1, 22, 5)
          expect(version.tgt?('1.23.5')).to eq false
        end
      end
      context 'when version is 1.23.4' do
        it 'returns false' do
          version = Dashv::Version.new(1, 23, 0)
          expect(version.tgt?('1.23.5')).to eq false
        end
      end
      context 'when version is 1.23.5' do
        it 'returns true' do
          version = Dashv::Version.new(1, 23, 5)
          expect(version.tgt?('1.23.5')).to eq true
        end
      end
      context 'when version is 1.24.0' do
        it 'returns false' do
          version = Dashv::Version.new(1, 24, 0)
          expect(version.tgt?('1.23.5')).to eq false
        end
      end
      context 'when version is 2.0.0' do
        it 'returns false' do
          version = Dashv::Version.new(2)
          expect(version.tgt?('1.23.5')).to eq false
        end
      end
    end
    context 'when given 1.5' do
      context 'when version is 0.5.5' do
        it 'returns false' do
          version = Dashv::Version.new(0, 5, 5)
          expect(version.tgt?('1.5')).to eq false
        end
      end
      context 'when version is 1.4.5' do
        it 'returns false' do
          version = Dashv::Version.new(1, 4, 5)
          expect(version.tgt?('1.5')).to eq false
        end
      end
      context 'when version is 1.5.0' do
        it 'returns true' do
          version = Dashv::Version.new(1, 5, 0)
          expect(version.tgt?('1.5')).to eq true
        end
      end
      context 'when version is 1.5.1' do
        it 'returns true' do
          version = Dashv::Version.new(1, 5, 1)
          expect(version.tgt?('1.5')).to eq true
        end
      end
      context 'when version is 1.24.0' do
        it 'returns true' do
          version = Dashv::Version.new(1, 24, 0)
          expect(version.tgt?('1.5')).to eq true
        end
      end
      context 'when version is 2.0.0' do
        it 'returns false' do
          version = Dashv::Version.new(2)
          expect(version.tgt?('1.5')).to eq false
        end
      end
    end
    context 'when given 1' do
      context 'when version is 0.9.5' do
        it 'returns false' do
          version = Dashv::Version.new(0, 9, 5)
          expect(version.tgt?('1')).to eq false
        end
      end
      context 'when version is 1.0.0' do
        it 'returns true' do
          version = Dashv::Version.new(1, 0, 0)
          expect(version.tgt?('1')).to eq true
        end
      end
      context 'when version is 1.0.5' do
        it 'returns true' do
          version = Dashv::Version.new(1, 0, 5)
          expect(version.tgt?('1')).to eq true
        end
      end
      context 'when version is 1.99.5' do
        it 'returns true' do
          version = Dashv::Version.new(1, 99, 5)
          expect(version.tgt?('1')).to eq true
        end
      end
      context 'when version is 2.0.0' do
        it 'returns true' do
          version = Dashv::Version.new(2)
          expect(version.tgt?('1')).to eq true
        end
      end
    end
  end# }}}
end
