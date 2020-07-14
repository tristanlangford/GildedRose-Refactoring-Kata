class UpdateAgedBrie
  QUALITY_INCREASE = 1

  def initialize(item)
    @item = item
  end

  def update
    @item.quality += QUALITY_INCREASE unless @item.quality == 50
    reduce_sell_in
  end

  def reduce_sell_in
    @item.sell_in -= 1
  end
end
