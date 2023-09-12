module GenreModule
  def self.add_genre(genres)
    id = generate_id(genres)
    name = genre_name

    genre = Genre.new(id, name)
    genres << genre
    puts 'Genre successfully added.'
  end

  def self.list_genres(genres)
    puts 'List of Genres:'
    genres.each_with_index do |genre, index|
      puts "#{index + 1}. Name: #{genre.name}"
    end
  end

  def self.genre_name
    puts 'Enter the Genre name:'
    gets.chomp
  end

  def self.generate_id(genres)
    max_id = genres.map { |genre| genre.id.to_i }.max || 0
    (max_id + 1).to_s
  end
end
