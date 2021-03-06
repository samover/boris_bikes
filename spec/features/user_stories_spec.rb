describe 'User Stories' do
  let(:station) { Station.new }
  let(:bike) { Bike.new }
  let(:broken_bike) { Bike.new }
  let(:van) { Van.new }
  let(:garage) { Garage.new }

  before(:each) { broken_bike.report_broken }

  # As a person,
  # So that I can use a bike,
  # I'd like a docking station to release a bike.
  it 'so that I can use a bike, a station releases a bike' do
    station.dock bike
    expect(station.release_bike).to equal bike
  end

  # As a person,
  # So that I can use a good bike,
  # I'd like to see if a bike is working
  it 'so that I can use a good bike, I like to see it is working' do
    expect(bike).to be_working
  end

  # As a member of the public
  # So I can return bikes I've hired
  # I want to dock my bike at the docking station
  it 'so that I can return a bike, I want to dock by bike at a station' do
    expect { station.dock bike }.not_to raise_error
  end

  # As a member of the public
  # So I can decide whether to use the docking station
  # I want to see a bike that has been docked
  it 'so that I can decide whether to use the station,
      I want to see a bike that has been docked' do
    station.dock bike
    expect(station.bikes).to include bike
  end

  # As a member of the public,
  # So that I am not confused and charged unnecessarily,
  # I'd like docking stations not to release bikes when there are none available
  it 'so that I am informed, I would like a message
      when no bikes are available' do
    message = 'Cannot release bike: none available in Station'
    expect { station.remove_bike }.to raise_error message
  end

  # As a maintainer of the system,
  # So that I can control the distribution of bikes,
  # I'd like docking stations not to accept more bikes than their capacity.
  it 'so that I can control distribution, I would like a message when that
      docking station is full to capacity' do
    message = 'Cannot dock bike: Station is full to capacity'
    station.capacity.times { station.dock bike }
    expect { station.dock bike }.to raise_error message
  end

  # As a system maintainer,
  # So that I can plan the distribution of bikes,
  # I want a docking station to have a default capacity of 20 bikes.
  it "so that I can plan distribution, I want
      a default capacity of #{Station::DEFAULT_CAPACITY}" do
    expect(station.capacity).to eq Station::DEFAULT_CAPACITY
  end

  # As a system maintainer,
  # So that busy areas can be served more effectively,
  # I want to be able to specify a larger capacity when necessary.
  it 'so that I can customize new station, I can specify another capacity' do
    station = Station.new(capacity: 50)
    expect(station.capacity).to eq 50
  end

  # As a member of the public,
  # So that I reduce the chance of getting a broken bike in future,
  # I'd like to report a bike as broken when I return it.
  it 'as a user, I would like to report a broken bike' do
    bike.report_broken
    expect(bike).not_to be_working
  end

  # As a maintainer of the system,
  # So that I can manage broken bikes and not disappoint users,
  # I'd like docking stations not to release broken bikes.
  it 'so not to disappoint users, stations do not release broken bikes' do
    message = 'Cannot release bike: none available in Station'
    station.dock broken_bike
    expect { station.release_bike }.to raise_error message
    station.dock bike
    expect(station.release_bike).to be_working
  end

  # As a maintainer of the system,
  # So that I can manage broken bikes and not disappoint users,
  # I'd like docking stations to accept returning bikes (broken or not).
  it 'so that I can manage broken bikes, station accepts broken ones' do
    station.dock broken_bike
    expect(station.bikes).to include broken_bike
  end

  # As a maintainer of the system,
  # So that I can manage broken bikes and not disappoint users,
  # I'd like vans to take broken bikes from docking stations
  # and deliver them to garages to be fixed.
  it 'so to manage broken bikes, a van can pick up broken bikes
      and deliver them to garage to be fixed' do
    5.times { station.dock Bike.new.report_broken }
    5.times { station.dock Bike.new }
    working_bikes = station.bikes.select(&:working?)
    broken_bikes = station.bikes - working_bikes

    van.collect_broken_bikes(station)
    expect(van.bikes).to eq broken_bikes
    expect(station.bikes).to eq working_bikes

    van.deliver_broken_bikes(garage)
    expect(van.bikes).to be_empty
    expect(garage.bikes).to eq broken_bikes
    garage.fix_bikes
    garage.bikes.each { |bike| expect(bike).to be_working }
  end

  # As a maintainer of the system,
  # So that I can manage broken bikes and not disappoint users,
  # I'd like vans to collect working bikes from garages
  # and distribute them to docking stations.
  it 'so to manage broken bikes, I would like vans to collect them from garage
      and deliver them to docking station' do
    bikes = Array.new(5, Bike.new)
    bikes.each { |bike| garage.receive bike }
    van.collect_working_bikes garage

    expect(garage.bikes).to be_empty
    expect(van.bikes).to eq bikes

    van.distribute_bikes station

    expect(van.bikes).to be_empty
    expect(station.bikes).to eq bikes
  end
end
