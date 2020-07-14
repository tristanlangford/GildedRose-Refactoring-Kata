require_relative './update_aged_brie'
require_relative './update_backstage_pass'
require_relative './update_normal_item'
require_relative './update_sulfuras'

class GildedRose

  QUALITY_MAX = 50
  QUALITY_MIN = 0

  attr_reader :items

  def initialize(items)
    @items = put_items_into_classes(items)
  end

  def update_quality()
    @items.each { |item| 
        item.update
      }
  end

  def put_items_into_classes(items_array)
    items_array.map { |item|
      if item.name.include?('Aged Brie')
        UpdateAgedBrie.new(item)
      elsif item.name.include?('Backstage Pass')
        UpdateBackstagePass.new(item)
      elsif item.name.include?('Sulfuras')
        UpdateSulfuras.new(item)
      else
        UpdateNormalItem.new(item)
      end
    }
  end

end
  