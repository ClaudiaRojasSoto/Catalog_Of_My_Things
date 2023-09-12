require_relative 'book'
require_relative 'modules/book_module'
require_relative 'label'
require_relative 'modules/label_module'
require_relative 'music_album'
require_relative 'modules/music_album_module'
require_relative 'genre'
require_relative 'modules/genre_module'
require_relative 'data_persistence'

class App
  def initialize
    load_data
    initialize_collections
    initialize_actions
  end

  def run
    loop do
      display_menu
      choice = gets.chomp.to_i
      action = @actions[choice]
      if action
        action.call
        save_data
      else
        puts 'Invalid choice.'
      end
    end
  end

  private

  def load_data
    collections = DataPersistence.load_data
    @books = collections[:books] || []
    @labels = collections[:labels] || initialize_labels
    # inicializar el resto de las colecciones aquí si hay datos previos
  end

  def save_data
    collections = {
      books: @books.map(&:to_hash),
      labels: @labels.map(&:to_hash)
    }
    DataPersistence.save_data(collections)
  end

  def initialize_collections
    @books ||= []
    @music_albums ||= []
    @games ||= []
    @labels ||= initialize_labels
    @genres ||= initialize_genres
    @initialize_collections ||= []
  end

  def initialize_actions
    @actions = {
      1 => method(:add_book),
      2 => method(:add_music_album),
      3 => method(:add_game),
      4 => method(:list_all_books),
      5 => method(:list_all_music_albums),
      6 => method(:list_all_games),
      7 => method(:list_all_labels),
      8 => method(:list_all_genres),
      9 => method(:list_all_authors),
      10 => method(:exit_app)
    }
  end

  def initialize_labels
    [
      Label.new('1', 'New', 'Green'),
      Label.new('2', 'Older', 'Yellow'),
      Label.new('3', 'Gift', 'Red')
    ]
  end

  def initialize_genres
    [
      Genre.new('1', 'Rock'),
      Genre.new('2', 'Jazz'),
      Genre.new('3', 'Classical')
    ]
  end

  def display_menu
    puts '1. Add Book'
    puts '2. Add Music Album'
    puts '3. Add Game'
    puts '4. List All Books'
    puts '5. List All Music Albums'
    puts '6. List All Games'
    puts '7. List All Labels'
    puts '8. List All Genres'
    puts '9. List All Authors'
    puts '10. Exit'
  end

  def exit_app
    puts 'Goodbye!'
    exit
  end

  def add_book
    if @labels.empty?
      puts 'No labels available. Please add a label first.'
    else
      BookModule.add_book(@books, @genres, @authors, @labels)
    end
  end

  def add_music_album
    if @labels.empty? || @genres.empty?
      puts 'No labels or genres available. Please add them first.'
    else
      MusicAlbumModule.add_music_album(@music_albums, @genres)
    end
  end

  def add_game
    'mock'
  end

  def list_all_books
    BookModule.list_books(@books)
  end

  def list_all_music_albums
    MusicAlbumModule.list_albums(@music_albums)
  end

  def list_all_games
    'mock'
  end

  def list_all_labels
    LabelModule.list_labels(@labels)
  end

  def list_all_genres
    GenreModule.list_genres(@genres)
  end

  def list_all_authors
    'mock'
  end
end
