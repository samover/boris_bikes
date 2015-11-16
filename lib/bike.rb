# Bike Class
class Bike
  def initialize
    @working_order = true
  end

  def working?
    working_order
  end

  def broken?
    !working_order
  end

  def report_broken
    self.working_order = false
    self
  end

  def report_working
    self.working_order = true
    self
  end

  private

  attr_accessor :working_order
end
