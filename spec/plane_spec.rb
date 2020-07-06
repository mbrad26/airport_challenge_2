require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { instance_double(Airport) }

  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:airport) }
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'keeps a record of the landing airport' do
    plane.land(airport)

    expect(plane.airport).to eq airport
  end

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

        plane.land(airport)

        expect { plane.land(airport) }.to raise_error error_message
      end
    end
  end
end
