module LabelModule
  def self.list_labels(labels)
    puts 'List of Labels:'
    labels.each_with_index do |label, index|
      puts "#{index + 1}. Title: #{label.title}, Color: #{label.color}"

      # List all the items associated with each label
      if label.items.empty?
        puts '  No items associated.'
      else
        puts '  Items associated:'
        label.items.each_with_index do |item, item_index|
          puts "    #{item_index + 1}. Type: #{item.class.name}, ID: #{item.id}"

          # Print additional information based on the type of item
          case item
          when Book
            puts "      Publisher: #{item.publisher}"
            puts "      Cover State: #{item.cover_state}"
          end
        end
      end
    end
  end

  def self.add_label(labels)
    id = generate_id(labels)
    title = label_title
    color = label_color

    label = Label.new(id, title, color)
    labels << label
    puts 'Label successfully added.'
  end

  # Add a function to generate id
  def self.generate_id(labels)
    max_id = labels.map { |label| label.id.to_i }.max || 0
    (max_id + 1).to_s
  end

  def self.label_title
    puts 'Choose a Label title:'
    gets.chomp
  end

  def self.label_color
    puts 'Choose a Label color:'
    gets.chomp
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
