class Station
  attr_reader :docker
  
  def initialize
    @docker = []
  end

  def dock bike
    docker << bike
  end

  def release_bike
    docker.pop
  end

end
