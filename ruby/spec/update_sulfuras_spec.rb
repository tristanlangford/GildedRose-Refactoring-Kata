require 'update_sulfuras'

describe UpdateNormalItem do
  let(:item) { Item.new('sulfuras', 5, 5) }

  it "won't change sulfuras properties" do
    shop = UpdateSulfuras.new(item)
    shop.update
    expect(item.quality).to eq(5)
  end
end
