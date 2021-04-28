require_relative 'bike'

class DockingStation
attr_reader :bike

  def release_bike
    raise "Error: there are no bikes" unless @bike
    @bike
  end

  def dock(bike)
    raise "Error: no spaces" if @bike
    @bike = bike
  end
end 