require 'json'

module Output
  def write_file(taked_game, file_name)
    json_file = JSON.generate(taked_game)
    File.open(file_name, 'w')
    File.write(file_name, json_file)
  end

  def read_file_game
    return [] unless File.exist?('games.json')

    file_name = 'games.json'
    File.open(file_name)
    take_data = File.read('games.json')
    @taked_games = JSON.parse(take_data)
    convert_game
  end

  def convert_game
    @taked_games.each do |i|
      @games.push(Game.new(i['multiplayer'], i['last_played_at'], i['publish_date'], @authors[i['author'].to_i]))
    end
  end
end
