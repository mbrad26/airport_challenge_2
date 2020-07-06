require_relative 'weather'

class Airport
  attr_reader :planes
  CAPACITY = 10

  def initialize(capacity = CAPACITY, weather)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise 'Airport at full capacity!' if full?
    raise 'Plane can not land: weather is stormy!' if stormy?

    plane.land(self)
    planes << plane
  end

  def take_off(plane)
    raise 'Plane can not take_off: weather is stormy!' if stormy?
    raise 'Plane not at this airport!' unless planes.include? plane

    plane.take_off
    planes.delete(plane)
  end

  private

  attr_reader :capacity, :weather

  def full?
    planes.length >= capacity
  end

  def stormy?
    weather.stormy?
  end
end
