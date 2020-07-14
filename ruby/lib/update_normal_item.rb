class UpdateNormalItem

    QUALITY_DECREASE = 1
    QUALITY_DECREASE_AFTER_SELL_BY = 2

    def initialize(item)
        @item = item
    end

    def update() 
        unless @item.quality == 0
            if sell_in_check()
                update_quality_sell_in_0()
            else
                update_quality()
            end
        end
    end

    def sell_in_check()
        @item.sell_in <= 0
    end

    def update_quality_sell_in_0()
        @item.quality -= QUALITY_DECREASE_AFTER_SELL_BY
    end

    def update_quality()
        @item.quality -= QUALITY_DECREASE
    end

end