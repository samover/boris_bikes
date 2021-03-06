# BikeContainer module
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

  def add(bike)
    fail "Cannot dock bike: #{self.class.name} is full to capacity" if full?
    container << bike
  end

  def remove_bike
    fail "Cannot release bike: none available in #{self.class.name}" if empty?
    bikes.pop
  end

  private

  attr_accessor :container

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end
end
