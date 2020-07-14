require 'update_aged_brie'

describe UpdateAgedBrie do 

    let(:brie) { Item.new("Aged Brie", 5, 5) }

    it "update_brie" do 
        shop = UpdateAgedBrie.new(brie)
        shop.update()
        expect(brie.quality).to eq(6)
      end

end