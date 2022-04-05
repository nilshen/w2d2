class Room
  attr_reader :capacity, :occupants

  def initialize(num)
    @capacity = 3
    @occupants = []
  end

  def full?
    if occupants.length < 3
        return false
    end
    true
  end

  def available_space
    @capacity - occupants.length
  end

  def add_occupant (str)
    if !full?
        occupants << str 
        return true
    end
    false
  end
end