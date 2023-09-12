require_relative '../label'
require_relative '../item'

RSpec.describe Label do
  before :each do
    @label = Label.new(1, 'Fiction', 'Red')
  end

  describe '#initialize' do
    it 'creates an instance of Label with given attributes' do
      expect(@label.id).to eq(1)
      expect(@label.title).to eq('Fiction')
      expect(@label.color).to eq('Red')
    end

    it 'initializes items as an empty array' do
      expect(@label.items).to eq([])
    end
  end

  describe '#add_item' do
    it 'adds an item to the items array' do
      item = Item.new({ id: 1, label: @label })
      @label.add_item(item)
      expect(@label.items).to include(item)
    end

    it 'sets the item label to itself' do
      item = Item.new({ id: 1, label: @label })
      @label.add_item(item)
      expect(item.label).to eq(@label)
    end
  end
end
