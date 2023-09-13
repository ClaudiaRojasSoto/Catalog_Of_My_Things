require_relative '../game'
require_relative '../author'

describe Game do

  describe '#can_be_archived?' do
    context 'when last_played_at is greater than 2 years' do
      it 'returns return true' do
        @author = Author.new('franck', 'sefu')
        @game = Game.new(true, '12-12-2000', '12-12-2001', @author)
        expect(@game.send(:can_be_archived?)).to eq(true)
      end
    end

    context 'when last_played_at is less than 2 years' do
      it 'returns false' do
        @author = Author.new('franck', 'sefu')
        @game = Game.new(true, '12-12-2023', '12-12-2023', @author)
        expect(@game.send(:can_be_archived?)).to eq(false)
      end
    end
  end
end