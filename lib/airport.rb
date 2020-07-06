class Airport
  attr_reader :planes, :capacity
  CAPACITY = 10

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport at full capacity!' if planes.length >= capacity
    planes << plane
  end

  def take_off(plane)
    planes.pop
  end
end
