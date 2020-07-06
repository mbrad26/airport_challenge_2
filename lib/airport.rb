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
    planes.pop
  end

  private

  def full?
    planes.length >= capacity
  end
end
