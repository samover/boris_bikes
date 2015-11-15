describe Station do

  subject(:station) { described_class.new }
  let(:bike) { double(:bike, working?: true) }

  context '#initialize' do
      it 'has a set capacity' do
        expect(station).to respond_to(:read_capacity)
      end

      it "has a default capacity of #{Station::DEF_CAPACITY}" do
        expect(station.read_capacity).to eq Station::DEF_CAPACITY
      end

      it 'can have another capacity' do
        larger_station = Station.new(capacity: 30)
        expect(larger_station.read_capacity).to eq 30
      end
  end

  context '#release_bike' do

    it 'releases a bike' do
      station.dock bike
      expect(station.release_bike).to eq bike
    end

    it 'raises error when none available' do
      expect { station.release_bike }.to raise_error 'Cannot release bike: none available'
    end
  end

  context '#dock' do
    it 'docks a bike' do
      expect { station.dock bike }.not_to raise_error
    end

    it 'raises error when station is full' do
      station.read_capacity.times { station.dock bike }
      expect { station.dock bike }.to raise_error 'Cannot dock bike: station is full to capacity'
    end
  end

  context '#bikes' do
    it 'shows the docked bikes' do
      station.dock bike
      expect(station.bikes).to include bike
    end
  end
end
