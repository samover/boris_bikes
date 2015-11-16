describe Garage do
  subject(:garage) { described_class.new }
  let(:broken_bike) { double(:bike, working?: false, report_working: true) }
  let(:bikes) { [broken_bike, broken_bike, broken_bike, broken_bike] }

  context '#receive' do
    it 'receives a delivery of broken bikes' do
      bikes.each { |bike| garage.receive bike }
      expect(garage.bikes).to eq bikes
    end
  end

  context '#fix_bikes' do
    it 'fixes all the bikes' do
      allow(broken_bike).to receive(:working?).and_return(true)
      bikes.each { |bike| garage.receive bike }
      garage.fix_bikes
      garage.bikes.each { |bike| expect(bike).to be_working }
    end
  end

  context '#release_bikes' do
    it 'releases fixed bixes to a van' do
      bikes.each { |bike| garage.receive bike }
      garage.fix_bikes
      garage.release_bikes
      expect(garage.bikes).to be_empty
    end
  end

  it_behaves_like BikeContainer
end
