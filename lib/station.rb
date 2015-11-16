require_relative 'bike_container'

# Station Class
class Station
  include BikeContainer

  def dock(bike)
    add bike
  end

  def release_bike
    message = 'Cannot release bike: none available in Station'
    fail message if working_bikes.empty?
    bikes.delete(working_bikes.pop)
  end

  def release_broken_bikes
    released = broken_bikes
    self.container -= broken_bikes
    released
  end

  private

  def working_bikes
    bikes.select(&:working?)
  end

  def broken_bikes
    bikes.select(&:broken?)
  end
end
