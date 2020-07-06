class Airport
  attr_reader :planes, :capacity
  CAPACITY = 10

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport at full capacity!' if full?

    planes << plane
  end

  def take_off(plane)
    raise 'Plane can not take_off: weather is stormy!' if stormy?

    planes.delete(plane)
  end

  private

  def full?
    planes.length >= capacity
  end

  def stormy?
    rand(1..10) > 7
  end
end
