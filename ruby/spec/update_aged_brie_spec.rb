require 'update_aged_brie'

describe UpdateAgedBrie do 

    let(:brie) { Item.new("Aged Brie", 5, 5) }
    let(:old_brie) { Item.new("Aged Brie", 5, 50) }

    it "update brie quality" do 
        shop = UpdateAgedBrie.new(brie)
        shop.update()
        expect(brie.quality).to eq(6)
      end

      it "won't update brie quality if quality is 50" do 
        shop = UpdateAgedBrie.new(old_brie)
        shop.update()
        expect(old_brie.quality).to eq(50)
      end

end