shared_examples_for BikeContainer do

  subject(:bike_container) { described_class.new }
  let(:bike) { double(:bike) }

  context '#initialize' do
    it 'has a default capacity when initialized' do
      expect(bike_container.capacity).to eq BikeContainer::DEFAULT_CAPACITY
    end

    it 'can have another capacity when created' do
      random_capacity = rand(100)
      bike_container = described_class.new(capacity: random_capacity)
      expect(bike_container.capacity).to eq random_capacity
    end
  end

  context '#add' do
    it 'adds a bike to the container' do
      expect { bike_container.add bike }.not_to raise_error
    end

    it 'raises error when container is full' do
      bike_container.capacity.times { bike_container.add bike }
      message = "Cannot dock bike: #{described_class.name} is full to capacity"
      expect { bike_container.add bike }.to raise_error message
    end
  end

  context '#remove_bike' do

    before(:each) { bike_container.add bike }

    it 'returns a bike' do
      expect(bike_container.remove_bike).to eq bike
    end

    it 'removes the bike from the collection' do
      bike_container.remove_bike
      expect(bike_container.bikes).to be_empty
    end

    it 'raises error when none available' do
      message = "Cannot release bike: none available in #{described_class.name}"
      bike_container.remove_bike
      expect { bike_container.remove_bike }.to raise_error message
    end
  end

end
