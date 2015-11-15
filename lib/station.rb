class Station

  DEF_CAPACITY = 20

  def initialize
    @docker = []
    @capacity = DEF_CAPACITY
  end

  def dock bike
    fail 'Cannot dock bike: station is full to capacity' if full?
    docker << bike
  end

  def release_bike
    fail 'Cannot release bike: none availble' if empty?
    docker.pop
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
    bikes.empty?
  end

  def full?
    bikes.length >= read_capacity
  end

end
