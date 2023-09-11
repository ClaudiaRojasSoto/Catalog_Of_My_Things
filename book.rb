require_relative 'item'

# Class representing a Book
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(params = {})
    super(params)
    @publisher = params[:publisher]
    @cover_state = params[:cover_state]
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
