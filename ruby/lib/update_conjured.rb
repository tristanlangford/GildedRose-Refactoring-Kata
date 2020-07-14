class UpdateConjured 

    def initialize(item)
        @item = item
    end

    def update() 
        if (@item.quality - calc_increase) < 0
            @item.quality = 0
        else
            @item.quality -= calc_increase
        end
        reduce_sell_in()
    end

    def reduce_sell_in()
        @item.sell_in -= 1
    end

    def calc_increase()
        return 4 if @item.sell_in < 0
        
        return 2
    end

end