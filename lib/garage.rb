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

  def release_bikes
    empty_workfloor
  end

  private
  attr_accessor :work_floor

  def empty_workfloor
    fixed_bikes = work_floor
    self.work_floor = []
    fixed_bikes
  end
end
