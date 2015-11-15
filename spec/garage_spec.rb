describe Garage do

  subject(:garage) { described_class.new }
  let(:broken_bike) { double(:bike, working?: false, report_working: true)}
  let(:bikes) { [broken_bike, broken_bike, broken_bike, broken_bike] }

  context '#receive' do
    it 'receives a delivery of broken bikes' do
      garage.receive bikes
      expect(garage.bikes).to eq bikes
    end
  end

  context '#fix_bikes' do
    it 'fixes all the bikes' do
      allow(broken_bike).to receive(:working?).and_return(true)
      garage.receive bikes
      garage.fix_bikes
      garage.bikes.each { |bike| expect(bike).to be_working }
    end
  end
end
