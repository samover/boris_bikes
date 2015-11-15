class Station

  DEF_CAPACITY = 20

  def initialize(capacity: DEF_CAPACITY)
    @docker = []
    @capacity = capacity
  end

  def dock bike
    fail 'Cannot dock bike: station is full to capacity' if full?
    docker << bike
  end

  def release_bike
    fail 'Cannot release bike: none available' if empty?
    working_bikes.pop
  end

  def bikes
    docker
  end

  def read_capacity
    capacity
  end

  private
  attr_reader :docker, :capacity

  def empty?
    working_bikes.empty?
  end

  def full?
    bikes.length >= read_capacity
  end

  def working_bikes
    bikes.select { |bike| bike.working? }
  end

end
