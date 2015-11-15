module BikeContainer
  DEFAULT_CAPACITY = 20

  def initialize(capacity: DEFAULT_CAPACITY)
    @docker = capacity
  end

  def capacity
    docker
  end

  private
  attr_reader :docker
end
