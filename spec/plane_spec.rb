require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to(:take_off) }

  describe '#take_off' do
    context 'when plane is flying' do
      it 'raises an error' do
        error_message = 'Plane already flying!'
        
        expect { plane.take_off }.to raise_error error_message
      end
    end
  end
end
