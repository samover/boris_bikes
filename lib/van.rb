class Van

  def initialize
    @trailer = []
  end

  def collect_broken_bikes station
    station.release_broken_bikes.each { |bike| trailer << bike }
  end

  def bikes
    trailer
  end

  def deliver_broken_bikes garage
    garage.receive bikes
    empty_trailer
  end

  def empty_trailer
    self.trailer = []
  end

  def collect_working_bikes garage
    garage.release_bikes.each { |bike| trailer << bike }
  end

  def distribute_bikes station
    bikes.each { |bike| station.dock bike }
    empty_trailer
  end

  private
  attr_reader :trailer
  attr_accessor :trailer
end
