require 'date'

# Class representing an Item
class Item
  attr_accessor :id, :genre, :author, :label, :publish_date

  def initialize(params = {})
    @id = params[:id] || Random.rand(1..10_000)
    @genre = params[:genre]
    @author = params[:author]
    @label = params[:label]
    @publish_date = parse_date(params[:publish_date])
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
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  private

  attr_reader :archived

  def parse_date(date_string)
    return nil unless date_string

    begin
      Date.strptime(date_string, '%d-%m-%Y')
    rescue Date::Error
      # Silenciosamente establece la fecha de publicación a nil
      nil
    end
  end

  def can_be_archived?
    (Time.now.year - @publish_date.year > 10)
  end
end
