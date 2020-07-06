class Airport
  attr_reader :planes, :capacity

  def initialize
    @capacity = 10
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
