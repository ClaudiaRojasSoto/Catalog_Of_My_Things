# spec/label_module_spec.rb
require_relative '../modules/label_module'
require_relative '../label'
require_relative '../book'

RSpec.describe LabelModule do
  before do
    @labels = [
      Label.new('1', 'Label1', 'Red'),
      Label.new('2', 'Label2', 'Green')
    ]

    @book1 = double('Book')
    @book2 = double('Book')

    allow(@book1).to receive(:class).and_return(Book)
    allow(@book1).to receive(:id).and_return('1')
    allow(@book1).to receive(:label=)

    allow(@book2).to receive(:class).and_return(Book)
    allow(@book2).to receive(:id).and_return('2')
    allow(@book2).to receive(:label=)

    @label1 = @labels[0]
    @label2 = @labels[1]

    @label1.add_item(@book1)
    @label1.add_item(@book2)
  end

  describe '.list_labels' do
    # ... this test stays the same
  end

  describe '.add_label' do
    it 'adds a new label to the list' do
      allow(LabelModule).to receive(:label_title).and_return('NewLabel')
      allow(LabelModule).to receive(:label_color).and_return('NewColor')

      # Mocking Label.new to return a label double
      mock_label = double(Label, title: 'NewLabel', color: 'NewColor')

      # Stub the constructor for Label to return the mock_label
      allow(Label).to receive(:new).and_return(mock_label)

      expect { LabelModule.add_label(@labels) }.to change { @labels.count }.by(1)
      expect(@labels.last.title).to eq('NewLabel')
      expect(@labels.last.color).to eq('NewColor')
    end
  end
end
