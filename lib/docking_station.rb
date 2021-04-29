require_relative 'bike'

class DockingStation
attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "Error: there are no bikes" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    raise "Error: no spaces" if @bikes.length == 20
    @bikes << bike
  end
end 