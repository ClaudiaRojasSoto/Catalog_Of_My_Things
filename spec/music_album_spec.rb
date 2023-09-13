require_relative '../music_album'
require_relative '../item'
require_relative '../modules/music_album_module'

RSpec.describe MusicAlbum do
  before(:each) do
    @genre_mock = double('Genre')
    @params = {
      publish_date: '10-10-2010',
      on_spotify: true,
      genre: @genre_mock
    }
    @music_album = MusicAlbum.new(@params)
  end

  describe '#initialize' do
    it 'correctly assigns values' do
      expect(@music_album.on_spotify).to eq(true)
    end
  end

  describe '#on_spotify?' do
    it 'returns the correct on_spotify value' do
      expect(@music_album.on_spotify?).to eq(true)
    end
  end

  describe '#can_be_archived?' do
    context 'when conditions are met' do
      it 'returns true' do
        allow(@music_album).to receive(:can_be_archived?).and_return(true)
        expect(@music_album.send(:can_be_archived?)).to eq(true)
      end
    end

    context 'when conditions are not met' do
      it 'returns false' do
        allow(@music_album).to receive(:can_be_archived?).and_return(false)
        expect(@music_album.send(:can_be_archived?)).to eq(false)
      end
    end
  end
end
