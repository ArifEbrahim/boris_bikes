require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "Error: there are no bikes" if empty?
    @bikes.each do |bike|
      return bike if bike.working?
    end
    "Sorry,no working bikes available"
  end

  def dock(bike)
    raise "Error: no spaces" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end 