require_relative '../modules/music_album_module'
require_relative '../music_album'
require_relative '../genre'

RSpec.describe MusicAlbumModule do
  describe '.add_music_album' do
    it 'adds a music album to the albums array' do
      albums = []
      genres = [Genre.new(1, 'Rock'), Genre.new(2, 'Pop')]
      allow(described_class).to receive(:enter_publish_date).and_return('01-01-2022')
      allow(described_class).to receive(:on_spotify?).and_return(true)
      allow(described_class).to receive(:select_genre).with(genres).and_return(genres.first)

      described_class.add_music_album(albums, genres)

      expect(albums.size).to eq(1)
      expect(albums.first).to be_a(MusicAlbum)
    end

    it 'handles no genres available' do
      albums = []
      genres = []

      expect { described_class.add_music_album(albums, genres) }
        .to output("No genres available. Please add them first.\n").to_stdout
      expect(albums).to be_empty
    end
  end

  describe '.list_albums' do
    it 'lists the music albums' do
      albums = [MusicAlbum.new(publish_date: '01-01-2022', on_spotify: true, genre: Genre.new(1, 'Rock'))]

      expect { described_class.list_albums(albums) }
        .to output(/List of Music Albums:\n\d+\..+/).to_stdout
    end
  end
end
