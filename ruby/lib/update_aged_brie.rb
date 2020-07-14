class UpdateAgedBrie

    QUALITY_INCREASE = 1

    def initialize(item)
        @item = item
    end

    def update() 
        update_quality() unless @item.quality == 50
    end

    def update_quality()
        @item.quality += QUALITY_INCREASE
    end

end