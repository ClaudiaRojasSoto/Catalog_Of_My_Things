class App
  def initialize
    @books = []
    @music_albums = []
    @games = []
    @labels = []
    @genres = []
    @authors = []

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

  private

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
    'mock'
  end

  def add_music_album
    'mock'
  end

  def add_game
    'mock'
  end

  def list_all_books
    'mock'
  end

  def list_all_music_albums
    'mock'
  end

  def list_all_games
    'mock'
  end

  def list_all_labels
    'mock'
  end

  def list_all_genres
    'mock'
  end

  def list_all_authors
    'mock'
  end
end
