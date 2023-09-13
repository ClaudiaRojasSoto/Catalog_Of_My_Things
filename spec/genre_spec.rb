# genre_spec.rb
require_relative '../genre'

RSpec.describe Genre do
  before :each do
    @genre = Genre.new(1, 'Action')
  end

  describe '#add_item' do
    context 'when adding an item to the genre' do
      it 'adds the item to the genre' do
        item = double('item')
        expect(item).to receive(:genre=).with(@genre)
        @genre.add_item(item)
        expect(@genre.instance_variable_get(:@items)).to include(item)
      end

      it 'sets the genre of the item to the genre itself' do
        item = double('item')
        expect(item).to receive(:genre=).with(@genre)
        @genre.add_item(item)
      end
    end
  end
end
