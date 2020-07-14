class GildedRose

  QUALITY_MAX = 50
  QUALITY_MIN = 0

  def initialize(items)
    @items = items
  end

  def max?(item)
    item.quality >= QUALITY_MAX
  end

  def min?(item)
    item.quality <= QUALITY_MIN
  end

  def increase_quality_1(item)
    item.quality += 1 unless max?(item) 
  end

  def increase_quality_2(item)
    item.quality += 2 unless max?(item) 
  end

  def decrease_quality_1(item)
    item.quality -= 1 unless min?(item) 
  end

  def decrease_sell_in(item)
    item.sell_in -= 1
  end

  def update_backstage_pass(item) 
    case item.sell_in
    when -Float::INFINITY..0
      item.quality = 0
    when 0..5
      item.quality += 3 unless item.quality > 50
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
  
end
  