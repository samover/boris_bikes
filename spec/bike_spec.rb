describe Bike do

  subject(:bike) { described_class.new }

  context '#working?' do
    it 'is in working order' do
      expect(bike).to be_working
    end
  end
end
