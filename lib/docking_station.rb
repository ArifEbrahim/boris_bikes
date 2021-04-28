require_relative 'bike'

class DockingStation
attr_reader :bike

  def release_bike
    raise "Error: there are no bikes" if @bike.nil? 
    @bike
  end

  def dock(bike)
    raise "Error: no spaces" if !@bike.nil?
    @bike = bike
  end
end 