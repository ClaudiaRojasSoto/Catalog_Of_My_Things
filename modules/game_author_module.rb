require_relative 'inputs'
require_relative '../game'
require_relative '../author'

module GameAuthor
  def add_games()
    multiplayer = add_multiplayer
    last_played = add_last_played_at
    publish_date = add_publish_date
    list_author
    index = index_author.to_i
    author = @authors[index]
    [multiplayer, last_played, publish_date, author, index]
  end

  def list_game
    if @games.empty?
      puts 'No game yet, Add if you wanna see '
    else
      @games.each_with_index do |elt, idx|
        puts " IDX:#{idx} multiplayer : #{elt.multiplayer} last played at : #{elt.last_played_at} "
        puts "   Author : '#{elt.author.first_name}  #{elt.author.last_name}'\n "
      end
    end
  end

  def list_author
    @authors.each_with_index do |elt, idx|
      puts "\n   #{idx}) '#{elt.first_name}  #{elt.last_name}' "
    end
  end

  def initialize_author
    arr = []
    arr.push(Author.new('Martin', 'Acero'))
    arr.push(Author.new('Emmanuella', 'Davila'))
    arr.push(Author.new('Angel', 'Salvador'))
    arr
  end
end
