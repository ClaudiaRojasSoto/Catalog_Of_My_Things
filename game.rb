require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(genre: nil, author: nil, source: nil, label: nil, publish_date: publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    year = Time.now.year - Date.parse(last_played_at).year
    (super && year > 2)
  end
end
