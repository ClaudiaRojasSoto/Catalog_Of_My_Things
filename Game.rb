require 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super()
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?()
    tab_date = @last_played_at.split('/')
    year = 2023 - tab_date[0].to_i
    return true if super(can_be_archived) && (year > 2)

    false
  end
end
