class Genre
  attr_accessor :name

  def initialize(id, name)
    @name = name
    private
    @id = id
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
