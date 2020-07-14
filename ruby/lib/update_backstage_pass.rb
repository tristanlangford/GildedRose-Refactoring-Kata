class UpdateBackstagePass 

    def initialize(item)
        @item = item
    end

    def update() 
        if @item.sell_in <= -1
            @item.quality = 0 
        elsif @item.quality + calc_increase > 50 
            @item.quality = 50
        else
            @item.quality += calc_increase
        end
    end

    def calc_increase()
        case @item.sell_in
        when 0...5
            return 3
        when 6...10
            return 2
        else
            return 1
        end
    end

end