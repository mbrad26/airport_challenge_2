class Plane
  def initialize
    @flying = true
  end
  
  def take_off
    raise 'Plane already flying!'
  end

  def land
    raise 'Plane already landed!' unless @flying

    @flying = false
  end

  def airport
    raise 'Plane is flying!'
  end
end
