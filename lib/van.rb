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

  private
  attr_reader :trailer
  attr_accessor :trailer
end
