# Test para book.rb
require_relative '../book'
require_relative '../item'
require_relative '../modules/book_module'

RSpec.describe Book do
  before :each do
    @book = Book.new(
      publisher: 'Some Publisher',
      cover_state: 'good',
      id: 1,
      label: 'Some Label',
      publish_date: '01-01-2022'
    )
  end

  describe '#can_be_archived?' do
    context 'when cover_state is good' do
      it 'returns false' do
        expect(@book.send(:can_be_archived?)).to eq(false)
      end
    end

    context 'when cover_state is bad' do
      it 'returns true' do
        @book.cover_state = 'bad'
        expect(@book.send(:can_be_archived?)).to eq(true)
      end
    end
  end
end
