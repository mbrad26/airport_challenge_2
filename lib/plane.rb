class Plane
  def initialize
    @flying = true
    @airport = nil
  end

  def take_off
    raise 'Plane already flying!' if flying
  end

  def land(airport)
    raise 'Plane already landed!' unless flying

    @flying = false
    @airport = airport
  end

  def airport
    raise 'Plane is flying!' if flying
    
    @airport
  end

  private

  attr_reader :flying
end
