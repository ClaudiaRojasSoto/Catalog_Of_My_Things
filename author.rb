class Author
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name, items = [], id = 1)
    @first_name = first_name
    @last_name = last_name
    @items = items
    @id = id
  end


  def add_item(item)
    @items.push(item)
    item.author = self
  end

  private

  attr_reader :id, :items
end
