class Bike

  def initialize
    @working_order = true
  end

  def working?
    working_order
  end

  def report_broken
    self.working_order = false
    self
  end

  private
  attr_accessor :working_order
end
