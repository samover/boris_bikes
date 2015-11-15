class Garage

  def initialize
    @work_floor = []
  end

  def bikes
    work_floor
  end

  def receive bikes
    bikes.each { |bike| work_floor << bike }
  end

  def fix_bikes
    bikes.each { |bike| bike.report_working }
  end

  private
  attr_reader :work_floor
end
