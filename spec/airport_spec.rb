require 'airport'

describe Airport do
  let(:airport) { described_class.new }
  let(:plane) { instance_double('Plane') }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'has a default capacity' do
    capacity = described_class::CAPACITY
    error_message = 'Airport at full capacity!'

    capacity.times { airport.land(plane) }

    expect{ airport.land(plane) }.to raise_error error_message
  end

  describe '#land' do
    it 'instructs a plane to land' do
      airport.land(plane)

      expect(airport.planes).to include plane
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take_off' do
      airport.land(plane)
      airport.take_off(plane)

      expect(airport.planes).not_to include plane
    end
  end

  context 'when airport is full' do
    it 'prevents landing' do
      capacity = 10
      error_message = 'Airport at full capacity!'

      capacity.times do
        airport.land(plane)
      end

      expect{ airport.land(plane) }.to raise_error error_message
    end
  end
end
