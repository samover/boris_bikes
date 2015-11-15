class Bike

  attr_reader :working_order

  def initialize
    @working_order = true;
  end

  def working?
    working_order
  end

end
