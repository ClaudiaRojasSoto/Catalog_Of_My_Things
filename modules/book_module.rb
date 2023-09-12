module BookModule
  def self.list_books(books)
    puts 'List of Books:'
    books.each_with_index do |book, index|
      label_title = book.label ? book.label.title : 'N/A'
      puts "#{index + 1}. ID: #{book.id}, " \
           "Publisher: #{book.publisher}, " \
           "Cover State: #{book.cover_state}, " \
           "Label: #{label_title}"
    end
  end

  def self.add_book(books, _genres, _authors, labels)
    attributes = collect_attributes
    selected_label_index = collect_label_index(labels)
    label = labels[selected_label_index]
    attributes[:label] = label

    book = Book.new(attributes)
    book.add_label(label)
    books << book
    puts 'Book successfully added.'
  end

  def self.collect_attributes
    {
      publisher: input('Enter the publisher:'),
      cover_state: cover_state_input,
      label: nil,
      publish_date: input('Enter the publish date (DD-MM-YYYY):')
    }
  end

  def self.input(prompt)
    puts prompt
    gets.chomp
  end

  def self.cover_state_input
    puts "Enter the cover state: 1 for 'good', 2 for 'bad'"
    loop do
      choice = gets.chomp
      return 'good' if choice == '1'
      return 'bad' if choice == '2'

      puts "Invalid input. Please enter 1 for 'good' or 2 for 'bad'."
    end
  end

  def self.collect_label_index(labels)
    puts 'Choose a Label:'
    labels.each_with_index do |label, index|
      puts "#{index + 1}. #{label.title}"
    end

    loop do
      choice = gets.chomp.to_i
      return choice - 1 if choice.between?(1, labels.length)

      puts "Invalid input. Please enter a number between 1 and #{labels.length}."
    end
  end
end
