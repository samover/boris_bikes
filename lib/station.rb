class Station

  def initialize
    @docker = []
  end

  def dock bike
    docker << bike
  end

  def release_bike
    fail 'Cannot release bike: none availble' if empty?
    docker.pop
  end

  def bikes
    docker
  end

  private
  attr_reader :docker

  def empty?
    bikes.empty?
  end

end
