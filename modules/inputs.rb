def add_multiplayer
  puts '~~ Add Game ~~'
  print 'Do you want multiplayer or not [Y/N] : '
  input = gets.chomp
  while input != 'Y' && input != 'y' && input != 'N' && input != 'n'
    print 'Do you want multiplayer or not [Y/N](good answer please) : '
    input = gets.chomp
  end
  return true if %w[Y y].include?(input)

  false
end

def add_last_played_at
  print 'Add date for last_played : '
  gets.chomp
end

def add_publish_date
  print 'Add publish date : '
  gets.chomp
end

def index_author
	print 'Add author by the index  : '
  gets.chomp.to_i
end
