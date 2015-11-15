describe Station do

  subject(:station) { described_class.new }
  let(:bike) { double(:bike, working?: true) }
  let(:broken_bike) { double(:bike, working?: false) }

  context '#initialize' do

      it "has a default capacity of #{Station::DEFAULT_CAPACITY}" do
        expect(station.capacity).to eq Station::DEFAULT_CAPACITY
      end

      it 'can have another capacity' do
        larger_station = Station.new(capacity: 30)
        expect(larger_station.capacity).to eq 30
      end
  end

  context '#release_bike' do

    it 'releases a bike' do
      station.dock bike
      expect(station.release_bike).to eq bike
    end

    it 'raises error when none available' do
      expect { station.release_bike }.to raise_error 'Cannot release bike: none available in Station'
    end
  end

  context '#dock' do
    it 'docks a bike' do
      expect { station.dock bike }.not_to raise_error
    end

    it 'raises error when station is full' do
      station.capacity.times { station.dock bike }
      expect { station.dock bike }.to raise_error 'Cannot dock bike: Station is full to capacity'
    end
  end

  context '#bikes' do
    it 'shows the docked bikes' do
      station.dock bike
      expect(station.bikes).to include bike
    end
  end

  context '#release_broken_bikes' do
    it 'releases all the broken bikes' do
      5.times { station.dock broken_bike }
      broken_bikes = station.bikes
      expect(station.release_broken_bikes).to eq broken_bikes
    end
  end

  it_behaves_like BikeContainer
end
