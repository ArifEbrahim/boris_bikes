require 'docking_station'

RSpec.describe DockingStation do
  describe "#release_bike" do
    it "releases a bike" do
      bike = double(:working? => true)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "raises an error when trying to release a bike when empty" do
      expect{ subject.release_bike }.to raise_error(RuntimeError)
    end

    it "releases a working bike" do
      bike = double(:working? => true)
      subject.dock(bike)
      expect(subject.release_bike).to be bike
    end

    it "does not release a broken bike" do
      bike = double(:working? => false)
      subject.dock(bike)
      expect{ subject.release_bike }.to raise_error(RuntimeError)
    end
  
    it "returns a docked bike" do
      bike = double(:working? => true)
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end
  end

  describe "#dock" do
    it 'docks a bike' do 
      bike = (double :bike)
      expect(subject.dock(bike)).to include(bike)
    end

    it "raises an error when trying to dock a bike when full" do
      subject.capacity.times { subject.dock(double :bike) }
      expect { subject.dock(double :bike) }.to raise_error(RuntimeError)
    end
  end

  describe "setting capacity" do
    it "sets a default capacity of 20" do
      expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end

    let (:test) {DockingStation.new(35)}
    it "has a variable capacity" do
      expect(test.capacity).to eq(35) 
    end
  end
end