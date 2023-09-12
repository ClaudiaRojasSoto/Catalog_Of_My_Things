module MusicAlbumModule
  def self.add_music_album(albums, genres)
    if genres.empty?
      puts 'No genres available. Please add them first.'
      return
    end

    publish_date = enter_publish_date
    on_spotify = on_spotify?
    genre = select_genre(genres)

    album = MusicAlbum.new({
                             publish_date: publish_date,
                             on_spotify: on_spotify,
                             genre: genre
                           })

    albums << album
    puts 'Music Album successfully added.'
  end

  def self.enter_publish_date
    puts 'Enter the publish date (DD-MM-YYYY):'
    gets.chomp
  end

  def self.on_spotify?
    puts 'Is it on Spotify? (yes/no):'
    answer = gets.chomp
    answer == 'yes'
  end

  def self.select_genre(genres)
    puts 'Select a genre by index:'
    genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
    choice = gets.chomp.to_i
    genres[choice - 1]
  end

  def self.list_albums(albums)
    puts 'List of Music Albums:'
    albums.each_with_index do |album, index|
      puts "#{index + 1}. ID: #{album.id}, Genre Title: #{album.genre.name}, On Spotify: #{album.on_spotify}"
    end
  end
end
