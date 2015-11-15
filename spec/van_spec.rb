describe Van do

  subject(:van) { described_class.new }
  let(:station) { double(:station, bikes: bikes, release_broken_bikes: bikes) }
  let(:bike) { double(:bike, working?: false) }
  let(:garage) { double(:garage, receive: bike) }
  let(:bikes) { [bike, bike, bike, bike, bike]}

  before do
    van.collect_broken_bikes station
  end

  context '#bikes' do
    it 'shows the bikes in the trailer' do
      expect(van.bikes).to include bike
    end
  end

  context '#collect_broken_bikes' do
    it 'collects broken bikes from docking station' do
      expect(van.bikes).to eq bikes
    end
  end

  context '#deliver_broken' do
    it'delivers the broken vans to the garage' do
      van.deliver_broken_bikes garage
      expect(van.bikes).to be_empty
    end
  end
end
