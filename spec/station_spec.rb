describe Station do

  subject(:station) { described_class.new }
  let(:bike) { double(:bike) }

  context '#release_bike' do

    it 'releases a bike' do
      station.dock bike
      expect(station.release_bike).to eq bike
    end
  end

  context '#dock' do
    it 'docks a bike' do
      expect { station.dock bike }.not_to raise_error
    end
  end

  context '#bikes' do
    it 'shows the docked bikes' do
      station.dock bike
      expect(station.bikes).to include bike
    end
  end
end
