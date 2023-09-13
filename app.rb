require_relative 'book'
require_relative 'modules/book_module'
require_relative 'label'
require_relative 'modules/label_module'
require_relative 'music_album'
require_relative 'modules/music_album_module'
require_relative 'genre'
require_relative 'modules/genre_module'
require_relative 'modules/game_author_module'
require_relative 'modules/make_json_game'
require 'json'

class App
  include Output
  include GameAuthor

  def initialize
    initialize_collections
    initialize_actions
    load_books_from_json
    @games = []
    @authors = initialize_author
    @taked_games = []
  end

  def run
    loop do
      display_menu
      choice = gets.chomp.to_i
      action = @actions[choice]
      if action
        action.call
      else
        puts 'Invalid choice.'
      end
    end
  end

  def find_label_by_title(title)
    @labels.find { |label| label.title == title }
  end

  private

  # Nueva función para cargar libros desde un archivo JSON
  def load_books_from_json(filename = 'books.json')
    return unless File.exist?(filename)

    data = JSON.parse(File.read(filename))
    data.each do |book_data|
      book = Book.new(
        id: book_data['id'],
        title: book_data['title'], # Asegúrate de que esto esté en tus datos JSON
        publisher: book_data['publisher'],
        cover_state: book_data['cover_state'],
        publish_date: book_data['publish_date'],
        label: find_label_by_title(book_data['label'])
      )
      @books << book
    end
  end

  def write_books_to_json(filename = 'books.json')
    books_data = @books.map do |book|
      {
        'id' => book.id,
        'publisher' => book.publisher,
        'cover_state' => book.cover_state,
        'publish_date' => book.publish_date,
        'label' => book.label&.title
      }
    end

    File.write(filename, JSON.pretty_generate(books_data))
  end

  def initialize_collections
    @books = []
    @music_albums = []
    @labels = initialize_labels
    @genres = initialize_genres
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
      write_books_to_json # Llama al método para guardar los libros en un archivo JSON
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
    arr = add_games
    @games.push(Game.new(arr[0], arr[1], arr[2], arr[3]))
    @taked_games.push({ multiplayer: arr[0], last_played_at: arr[1], publish_date: arr[2], author: arr[4] })
    write_file(@taked_games, 'games.json')
  end

  def list_all_books
    BookModule.list_books(@books)
  end

  def list_all_music_albums
    MusicAlbumModule.list_albums(@music_albums)
  end

  def list_all_games
    read_file_game if @games == []
    list_game
  end

  def list_all_labels
    LabelModule.list_labels(@labels)
  end

  def list_all_genres
    GenreModule.list_genres(@genres)
  end

  def list_all_authors
    list_author
  end
end
