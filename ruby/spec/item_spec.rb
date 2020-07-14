require 'item'

describe Item do

    let(:item) { Item.new('foo', 1, 2)}

    it 'holds the name' do 
        expect(item.name).to eq('foo')
    end

    it 'holds the sell_in' do
        expect(item.sell_in).to eq(1)
    end

    it 'holds the quality' do
        expect(item.quality).to eq(2)
    end

    it 'return its components in a string' do
        expect(item.to_s).to eq('foo, 1, 2')
    end

end