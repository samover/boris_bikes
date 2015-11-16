describe Van do

  subject(:loaded_van) { described_class.new }
  subject(:empty_van) { described_class.new }

  let(:station) { double(:station, bikes: bikes, release_broken_bikes: bikes) }
  let(:bike) { double(:bike, working?: false) }
  let(:garage) { double(:garage, receive: bikes, release_bikes: bikes, dock: true) }
  let(:bikes) { [bike, bike, bike, bike, bike]}

  before do
    loaded_van.collect_broken_bikes station
  end

  context '#bikes' do
    it 'shows the bikes in the trailer' do
      expect(loaded_van.bikes).to include bike
    end
  end

  context '#collect_broken_bikes' do
    it 'collects broken bikes from docking station' do
      expect(loaded_van.bikes).to eq bikes
    end
  end

  context '#deliver_broken' do
    it 'delivers the broken vans to the garage' do
      loaded_van.deliver_broken_bikes garage
      expect(loaded_van.bikes).to be_empty
    end
  end

  context '#collect_working_bikes' do
    it 'collects working bikes from garage' do
      garage.receive bikes
      empty_van.collect_working_bikes garage
      expect(empty_van.bikes).to eq bikes
    end
  end

  context '#distribute_bikes' do
    it 'distributes fixed bikes to a docking station' do
      loaded_van.distribute_bikes garage
      expect(loaded_van.bikes).to be_empty
    end
  end

  it_behaves_like BikeContainer
end
