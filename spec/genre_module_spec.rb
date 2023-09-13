require_relative '../modules/genre_module'
require_relative '../genre'

RSpec.describe GenreModule do
  describe '.add_genre' do
    it 'adds a genre to the genres array' do
      genres = []
      allow(GenreModule).to receive(:genre_name).and_return('Action')
      allow(GenreModule).to receive(:generate_id).with([]).and_return('1')

      GenreModule.add_genre(genres)

      expect(genres.size).to eq(1)
      expect(genres.first.name).to eq('Action')
    end
  end

  describe '.list_genres' do
    it 'lists the genres' do
      genres = [Genre.new('1', 'Action'), Genre.new('2', 'Adventure')]
      expected_output = "List of Genres:\n1. Name: Action\n2. Name: Adventure\n"

      expect { GenreModule.list_genres(genres) }.to output(expected_output).to_stdout
    end
  end

  describe '.generate_id' do
    it 'generates a unique ID' do
      genres = [Genre.new('1', 'Action'), Genre.new('2', 'Adventure')]
      id = GenreModule.generate_id(genres)

      expect(id).to eq('3')
    end
  end
end
