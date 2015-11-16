class Garage
  include BikeContainer

  def receive bike
    add bike
  end

  def fix_bikes
    bikes.each { |bike| bike.report_working }
  end

  def release_bikes
    empty_garage
  end

  private
  def empty_garage
    fixed_bikes = container
    self.container = []
    fixed_bikes
  end
end
