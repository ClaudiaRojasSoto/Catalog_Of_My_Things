class Author
  attr_accessor :first_name, :last_name

  def initialize(id, first_name, last_name, items = [])
    @first_name = first_name
    @last_name = last_name
    private
    @items = items
    @id = id
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end
end
