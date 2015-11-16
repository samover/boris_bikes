# Van Class
class Van
  include BikeContainer

  def collect_broken_bikes(station)
    station.release_broken_bikes.each { |bike| container << bike }
  end

  def deliver_broken_bikes(garage)
    bikes.each { |bike| garage.receive bike }
    empty_van
  end

  def collect_working_bikes(garage)
    garage.release_bikes.each { |bike| container << bike }
  end

  def distribute_bikes(station)
    bikes.each { |bike| station.dock bike }
    empty_van
  end

  private

  def empty_van
    self.container = []
  end
end
