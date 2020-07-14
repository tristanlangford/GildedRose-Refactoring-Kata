require_relative './update_aged_brie'
require_relative './update_backstage_pass'
require_relative './update_normal_item'
require_relative './update_sulfuras'
require_relative './update_conjured'

class GildedRose

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
      elsif item.name.include?('Conjured')
        UpdateConjured.new(item)
      else
        UpdateNormalItem.new(item)
      end
    }
  end

end
  