class GildedRose

  def initialize(items)
    @items = items
  end

  def increase_quality_1(item)
    item.quality += 1 unless item.quality >= 50 
  end

  def increase_quality_2(item)
    item.quality += 2 unless item.quality >= 50 
  end

  def decrease_quality_1(item)
    item.quality -= 1 unless item.quality <= 0 
  end

  def decrease_sell_in(item)
    item.sell_in -= 1
  end

  def update_backstage_pass(item) 
    case item.sell_in
    when -Float::INFINITY..0
      item.quality = 0
    when 0..5
      item.quality += 3
    when  5..10 
      item.quality += 2 
    else 
      item.quality += 1
    end

  end

  def update_quality()
    @items.each { |item| 
      unless item.name == "sulfuras"
        case item.name 
        when "Aged Brie"
          increase_quality_1(item)
        when "Backstage Pass"
          update_backstage_pass(item)
        else
          decrease_quality_1(item)
        end
        decrease_sell_in(item)
      end
      }
  end





  def update_qualit()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end

# class Item
#   attr_accessor :name, :sell_in, :quality

#   def initialize(name, sell_in, quality)
#     @name = name
#     @sell_in = sell_in
#     @quality = quality
#   end

#   def to_s()
#     "#{@name}, #{@sell_in}, #{@quality}"
#   end
# end