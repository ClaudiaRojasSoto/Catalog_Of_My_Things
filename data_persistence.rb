require 'json'
require 'fileutils'

module DataPersistence
  DIRECTORY_NAME = 'data_store'.freeze

  def self.load_data
    FileUtils.mkdir_p(DIRECTORY_NAME)

    collections = {}
    Dir.foreach(DIRECTORY_NAME) do |file_name|
      next if ['.', '..'].include?(file_name)

      key = file_name.gsub('.json', '').to_sym
      file_path = File.join(DIRECTORY_NAME, file_name)
      collections[key] = JSON.parse(File.read(file_path))
    end
    collections
  end

  def self.save_data(collections)
    FileUtils.mkdir_p(DIRECTORY_NAME)

    collections.each do |key, data|
      serialized_data = data.map(&:to_hash)
      file_name = "#{key}.json"
      file_path = File.join(DIRECTORY_NAME, file_name)
      File.write(file_path, JSON.pretty_generate(serialized_data))
    end
  end
end
