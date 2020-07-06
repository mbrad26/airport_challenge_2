class Plane
  def initialize
    @flying = true
  end

  def take_off
    raise 'Plane already flying!' if @flying
  end

  def land(airport)
    raise 'Plane already landed!' unless @flying

    @flying = false
  end

  def airport
    raise 'Plane is flying!'
  end
end
