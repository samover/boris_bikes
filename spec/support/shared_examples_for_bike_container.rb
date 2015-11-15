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
      message = "Cannot dock bike: #{self.class.name} is full to capacity"
      expect { bike_container.add bike }.to raise_error
    end
  end


end
