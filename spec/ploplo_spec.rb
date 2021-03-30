describe "test" do
  context 'tashizan' do
    it '1 + 1は2になる' do
      expect(1 + 1).to eq 2
    end
  end
  context 'test' do
    it '1 + 1は2になる' do
      expect(1 + 1).to eq 3
    end
  end
  context "test" do
    it '1 + 1は2になる' do
      expect(1 + 1).to eq 4
    end
  end
end
