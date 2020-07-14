require 'update_normal_item'

describe UpdateNormalItem do

    let(:item) { Item.new('Normal', 5, 5)}
    let(:item0) { Item.new('Normal', 5, 0)}
    let(:item1) { Item.new('Normal', -1, 5)}

    it "update_normal_item" do 
        shop = UpdateNormalItem.new(item)
        shop.update
        expect(item.quality).to eq(4)
    end

    it "won't update quality if quality equals zero" do 
        shop = UpdateNormalItem.new(item0)
        shop.update
        expect(item0.quality).to eq(0)
    end

    it "update_normal_item quality by 2 if past sell_by" do 
        shop = UpdateNormalItem.new(item1)
        shop.update
        expect(item1.quality).to eq(3)
    end    
   
end