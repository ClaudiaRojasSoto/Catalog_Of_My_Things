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
    %w[yes y].include?(answer)
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
      puts "#{index + 1}. ID: #{album.id}, Genre: #{album.genre.name}, On Spotify: #{album.on_spotify}"
    end
  end

  def self.write_file(albums)
    albums_data = albums.map do |album|
      {
        'id' => album.id,
        'publish_date' => album.publish_date.strftime('%d-%m-%Y'),
        'on_spotify' => album.on_spotify,
        'genre' => album.genre.id
      }
    end
    File.write('music_albums.json', JSON.pretty_generate(albums_data))
  end

  def self.read_file(genres)
    if File.exist?('music_albums.json')
      file = File.read('music_albums.json')
      JSON.parse(file).map do |album|
        music_album = MusicAlbum.new({
                                       id: album['id'],
                                       publish_date: album['publish_date'],
                                       on_spotify: album['on_spotify']
                                     })
        music_album.genre = genres.find { |genre| genre.id == album['genre'] }
        music_album
      end
    else
      []
    end
  end
end
