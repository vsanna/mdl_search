module MdlSearch
  class Updater
    attr_writer :searcher
    def initialize
      @searcher = Searcher.new
    end

    def update_icons_yaml
      file_path = File.expand_path('../../../yaml/icons.yml', __FILE__)
      File.open(file_path, 'w') do |file|
        file.write @searcher.icons_as_yaml
      end
      puts 'complete updating icons yaml file... plz check it.'
    end

    def update_groups_yaml
      file_path = File.expand_path('../../../yaml/groups.yml', __FILE__)
      File.open(file_path, 'w') do |file|
        file.write @searcher.groups_as_yaml
      end
      puts 'complete updating groups yaml file... plz check it.'
    end

    def groups_from_yaml
      YAML.load(File.read(File.expand_path('./yaml/groups.yml')))
    end
  end
end
