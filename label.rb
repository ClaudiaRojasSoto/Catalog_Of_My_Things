# Class representing a Label
class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end

  def to_hash
    {
      id: @id,
      title: @title,
      color: @color,
      items: @items.map(&:id)
    }
  end
end
