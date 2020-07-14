require 'gilded_rose'
require 'item'

describe GildedRose do

  # brie = double("item", :name => 'Aged Brie', :sell_in => 5, :quality => 10)
  # sulfuras = double("item", :name => 'sulfuras', :sell_in => 5, :quality => 10)
  # backstage_less_5 = double("item", :name => 'Backstage Pass', :sell_in => 3, :quality => 10)
  # backstage_less_10 = double("item", :name => 'Backstage Pass', :sell_in => 8, :quality => 10)
  # backstage_more_10 = double("item", :name => 'Backstage Pass', :sell_in => 12, :quality => 10)
  # normal_good = double("item", :name => 'Normal', :sell_in => 5, :quality => 10)

  let(:brie) { Item.new('Aged Brie', 5, 5)}
  let(:sulfuras) { Item.new('sulfuras', 5, 5)}
  let(:normal_good) { Item.new('normal', 5, 5)}
  let(:backstage_12) { Item.new('Backstage Pass', 12, 5)}
  let(:backstage_8) { Item.new('Backstage Pass', 8, 5)}
  let(:backstage_3) { Item.new('Backstage Pass', 3, 5)}
  let(:backstage_minus1) { Item.new('Backstage Pass', -1, 5)}

  let(:items) { [brie, sulfuras] }

  let(:shop) { GildedRose.new(items) }

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("fixme", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end
  end

  it "checks if quality is at max" do 
    item = Item.new("normal", 5, 50)
    item1 = Item.new("normal", 5, 49)
    expect(shop.max?(item)).to be true
    expect(shop.max?(item1)).to be false
  end

  it "checks if quality is at min" do 
    item = Item.new("normal", 5, 0)
    item1 = Item.new("normal", 5, 1)
    expect(shop.min?(item)).to be true
    expect(shop.min?(item1)).to be false
  end

  it "update_brie" do 
    shop.increase_quality_1(brie)
    expect(brie.quality).to eq(6)
  end

  it "update_normal_item" do 
    shop.decrease_quality_1(brie)
    expect(brie.quality).to eq(4)
  end

  it "update sell_in" do 
    shop.decrease_sell_in(brie)
    expect(brie.sell_in).to eq(4)
  end

  it "increase quality by 2" do 
    shop.increase_quality_2(brie)
    expect(brie.quality).to eq(7)
  end

  describe "backstage passes" do 

    it 'increases quality by 1 if sell_in greater than 10' do 
      shop.update_backstage_pass(backstage_12)
      expect(backstage_12.quality).to eq(6)
    end

    it 'increases quality by 2 if sell_in lass than 10 but greater than 5' do 
      shop.update_backstage_pass(backstage_8)
      expect(backstage_8.quality).to eq(7)
    end

    it 'increases quality by 3 if sell_in lass than 5 but greater than 0' do 
      shop.update_backstage_pass(backstage_3)
      expect(backstage_3.quality).to eq(8)
    end

    it 'increases quality by 3 if sell_in lass than 5 but greater than 0' do 
      shop.update_backstage_pass(backstage_minus1)
      expect(backstage_minus1.quality).to eq(0)
    end

  end

  describe 'update quality' do 
    
    it "won't update sulfuras" do 
      shop = GildedRose.new([sulfuras])
      shop.update_quality
      expect(sulfuras.quality).to eq(5)
      expect(sulfuras.sell_in).to eq(5)
    end

    it "will increase quality and reduce sell_in for brie" do 
      shop = GildedRose.new([brie])
      shop.update_quality
      expect(brie.quality).to eq(6)
      expect(brie.sell_in).to eq(4)
    end

    it "will decrease quality and reduce sell_in for a normal good" do 
      shop = GildedRose.new([normal_good])
      shop.update_quality
      expect(normal_good.quality).to eq(4)
      expect(normal_good.sell_in).to eq(4)
    end

    it "will hand a backstage pass to the method" do 
      shop = GildedRose.new([backstage_8])
      shop.update_quality
      expect(backstage_8.quality).to eq(7)
      expect(backstage_8.sell_in).to eq(7)
    end

    it "won't increase quality above 50" do 
      cheese = Item.new("Aged Brie", 5, 50)
      shop = GildedRose.new([cheese])
      shop.update_quality
      expect(cheese.quality).to eq(50)
      expect(cheese.sell_in).to eq(4)
    end

    it "won't decrease quality below 0" do 
      item = Item.new("normal", 5, 0)
      shop = GildedRose.new([item])
      shop.update_quality
      expect(item.quality).to eq(0)
      expect(item.sell_in).to eq(4)
    end

  end

end
