require_relative '../author'
require_relative '../item'

describe Author do
  describe '#Check attribute' do
    context 'Check the first_name and the last_name' do
      it 'returns franck and sefu' do
        @author = Author.new('franck', 'sefu')
        expect(@author.first_name).to eq('franck')
        expect(@author.last_name).to eq('sefu')
      end
    end

    context 'when last_played_at is less than 2 years' do
      it 'returns false' do
        @author = Author.new('Germine', 'guz')
        @item = Item.new({ id: 1 })
        @author.add_item(@item)
        expect(@item.author).to eq(@author)
      end
    end
  end
end
