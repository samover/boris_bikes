require_relative 'bike_container'

class Station
  include BikeContainer

  # DEF_CAPACITY = 20

  # def initialize(capacity: DEF_CAPACITY)
  #   @docker = []
  #   @capacity = capacity
  # end

  def dock bike
    add bike
    # fail 'Cannot dock bike: station is full to capacity' if full?
    # docker << bike
  end

  def release_bike
    fail 'Cannot release bike: none available in Station' if working_bikes.empty?
    bikes.delete(working_bikes.pop)
  end

  def release_broken_bikes
    released = broken_bikes
    self.container -= broken_bikes
    released
  end

  # def bikes
  #   docker
  # end
  #
  # def remove_broken bikes
  #   self.docker -= bikes
  # end

  # def read_capacity
  #   capacity
  # end

  private
  # attr_reader :capacity
  # attr_accessor :docker

  # def empty?
  #   working_bikes.empty?
  # end

  # def full?
  #   bikes.length >= capacity
  # end

  def working_bikes
    bikes.select { |bike| bike.working? }
  end

  def broken_bikes
    bikes.select { |bike| !bike.working? }
  end

end
