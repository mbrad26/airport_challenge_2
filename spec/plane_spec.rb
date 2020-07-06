require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:airport) }
  it { is_expected.to respond_to(:land) }


  describe '#take_off' do
    context 'when plane is flying' do
      it 'raises an error' do
        error_message = 'Plane already flying!'

        expect { plane.take_off }.to raise_error error_message
      end
    end
  end

  describe '#airport' do
    context 'when plane is flying' do
      it 'raises an error' do
        error_message = 'Plane is flying!'

        expect { plane.airport }.to raise_error error_message
      end
    end
  end

  describe '#land' do
    context 'when plane is landed' do
      it 'raises an error' do
        error_message = 'Plane already landed!'
        
        plane.land

        expect { plane.land }.to raise_error error_message
      end
    end
  end
end
