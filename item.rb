require 'date'

# Class representing an Item
class Item
  attr_accessor :id, :genre, :author, :label, :publish_date

  def initialize(params = {})
    @id = Random.rand(1..10_000)
    @genre = params[:genre]
    @author = params[:author]
    @label = params[:label]
    @publish_date = (Date.strptime(params[:publish_date], '%d-%m-%Y') if params[:publish_date])
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_label(label)
    if label.is_a?(Hash)
      if label.key?('items')
        label['items'] << self
      else
        puts "Hash does not contain the 'items' key."
      end
    else
      label.items << self
    end
  end

  private

  attr_reader :archived

  def can_be_archived?
    Time.now.year - @publish_date.year > 10
  end

  public

  def to_hash
    {
      id: @id,
      genre: @genre,
      author: @author,
      label: @label,
      publish_date: @publish_date.to_s
    }
  end
end
