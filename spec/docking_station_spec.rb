require 'docking_station'

RSpec.describe DockingStation do
  # it { is_expected.to respond_to(:release_bike) }
  describe "#release_bike" do
    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  it "releases a working bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to be_working
  end

  # it { is_expected.to respond_to(:dock).with(1).argument}
  it 'docks a bike' do 
    bike = Bike.new
    expect(subject.dock(bike)).to eq(bike)
  end

  # it { is_expected.to respond_to(:bike)}
  it "returns a docked bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq(bike)
  end

  it "raises an error when trying to release a bike when empty" do
    expect { subject.release_bike }.to raise_error(RuntimeError)
  end

  describe "#dock" do
    it "raises an error when trying to dock a bike when full" do
      subject.dock(Bike.new)
      expect { subject.dock(Bike.new) }.to raise_error(RuntimeError)
    end
  end
end