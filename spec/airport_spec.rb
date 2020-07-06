require 'airport'

describe Airport do
  subject(:airport) { described_class.new(weather) }
  let(:plane) { instance_double(Plane, land: nil) }
  let(:weather) { instance_double(Weather)}

  before :each do
    allow(weather).to receive(:stormy?) { false }
  end

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'has a default capacity' do
    capacity = described_class::CAPACITY
    error_message = 'Airport at full capacity!'

    capacity.times { airport.land(plane) }

    expect { airport.land(plane) }.to raise_error error_message
  end

  describe '#land' do
    it 'instructs a plane to land' do
      expect(plane).to receive(:land)

      airport.land(plane)

      expect(airport.planes).to include plane
    end

    context 'when weather is stormy' do
      it 'prevents landing' do
        error_message = 'Plane can not land: weather is stormy!'
        allow(weather).to receive(:stormy?) { true }

        expect { airport.land(plane) }.to raise_error error_message
      end
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take_off' do
      airport.land(plane)

      expect(plane).to receive(:take_off)
      
      airport.take_off(plane)

      expect(airport.planes).not_to include plane
    end

    context 'when plane not at the airport' do
      it 'raises an error' do
        error_message = 'Plane not at this airport!'
        new_airport = described_class.new(15, weather)
        new_airport.land(plane)

        expect { airport.take_off(plane) }.to raise_error error_message
      end
    end

    context 'when weather is stormy' do
      it 'prevents take_off' do
        error_message = 'Plane can not take_off: weather is stormy!'
        allow(weather).to receive(:stormy?) { true }

        expect { airport.take_off(plane) }.to raise_error error_message
      end
    end
  end
end
