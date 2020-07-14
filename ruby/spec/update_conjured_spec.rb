require 'update_conjured'

describe UpdateConjured do
  let(:item) { Item.new('conjured', 5, 5) }
  let(:item0) { Item.new('conjured', 5, 0) }
  let(:item1) { Item.new('conjured', -1, 5) }
  let(:item2) { Item.new('conjured', 5, 1) }

  it 'reduces a conjured item quality by 2' do
    shop = UpdateConjured.new(item)
    shop.update
    expect(item.quality).to eq(3)
    expect(item.sell_in).to eq(4)
  end

  it "won't update quality if quality equals zero" do
    shop = UpdateConjured.new(item0)
    shop.update
    expect(item0.quality).to eq(0)
    expect(item0.sell_in).to eq(4)
  end

  it 'will set quality to 0 if quality would fall below 0' do
    shop = UpdateConjured.new(item2)
    shop.update
    expect(item2.quality).to eq(0)
    expect(item2.sell_in).to eq(4)
  end

  it 'update conjured quality by 4 if past sell_by' do
    shop = UpdateConjured.new(item1)
    shop.update
    expect(item1.quality).to eq(1)
    expect(item1.sell_in).to eq(-2)
  end
end
