describe Bike do

  subject(:bike) { described_class.new }

  context '#working?' do
    it 'is in working order' do
      expect(bike).to be_working
    end
  end

  context '#report_broken' do
    it 'can be reported as broken' do
      bike.report_broken
      expect(bike).not_to be_working
    end
  end
end
