module BikeContainer
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity: DEFAULT_CAPACITY)
    @capacity = capacity
    @container = []
  end

  def bikes
    container
  end

  def add bike
    fail "Cannot dock bike: #{self.class.name} is full to capacity" if full?
    container << bike
  end


  private
  attr_reader :docker, :container

  def full?
    bikes.length >= capacity
  end

end
