require_relative '../game'
require_relative '../author'
require 'rspec'

RSpec.describe Game do
  describe '#can_be_archived?' do
    context 'when last_played_at is greater than 2 years' do
      it 'returns return true' do
        author_mock = instance_double(Author, first_name: 'franck', last_name: 'sefu')
        @game = Game.new(true, '12-12-2000', '12-12-2001', author_mock)
        expect(@game.send(:can_be_archived?)).to eq(true)
      end
    end

    context 'when last_played_at is less than 2 years' do
      it 'returns false' do
        author_mock = instance_double(Author, first_name: 'Guy', last_name: 'sefu')
        @game = Game.new(true, '12-12-2023', '12-12-2023', author_mock)
        expect(@game.send(:can_be_archived?)).to eq(false)
      end
    end
  end
end
