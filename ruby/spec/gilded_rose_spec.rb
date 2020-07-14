require 'gilded_rose'
require 'item'

describe GildedRose do

  let(:brie) { Item.new('Aged Brie', 5, 5)}
  let(:sulfuras) { Item.new('Sulfuras', 5, 5)}
  let(:normal_good) { Item.new('normal', 5, 5)}
  let(:backstage_12) { Item.new('Backstage Pass', 12, 5)}
  let(:conjured) { Item.new('Conjured', 5, 5)}

  it 'correctly creates the class of the item' do
    items = [brie, sulfuras, normal_good, backstage_12, conjured]
    shop = GildedRose.new(items)
    expect(shop.items[0]).to be_an_instance_of (UpdateAgedBrie)
    expect(shop.items[1]).to be_an_instance_of (UpdateSulfuras)
    expect(shop.items[2]).to be_an_instance_of (UpdateNormalItem)
    expect(shop.items[3]).to be_an_instance_of (UpdateBackstagePass)
    expect(shop.items[4]).to be_an_instance_of (UpdateConjured)
  end

end
