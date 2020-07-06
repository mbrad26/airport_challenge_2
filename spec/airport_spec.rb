require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe '#land' do
    it 'instructs a plane to land' do
      airport = described_class.new
      plane = instance_double('Plane')

      airport.land(plane)

      expect(airport.planes).to include plane
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take_off' do
      airport = described_class.new
      plane = instance_double('Plane')

      airport.land(plane)
      airport.take_off(plane)

      expect(airport.planes).not_to include plane
    end
  end
end
