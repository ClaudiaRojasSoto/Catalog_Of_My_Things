require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify)
    super(params)
    @on_spotify = on_spotify
  end

  def on_spotify?
    @on_spotify == true
  end

  private

  def can_be_archived?
    super && (@publish_date.nil? || (Time.now.year - @publish_date.year > 10))
  end
end
