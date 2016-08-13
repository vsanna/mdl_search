module MdlSearch
  class Searcher
    attr_accessor :agent
    attr_accessor :result

    MDL_BASE = 'https://design.google.com'.freeze
    MDL_API_SUFFIX = '/icons/data'.freeze
    MDL_API_FOR_ALL_ICONS_INFO_SUFFIX = '/grid.json'.freeze

    def initialize
      @agent = create_agent
      @result = all_icons_info_json
    end

    def icons_as_yaml
      show_as_yaml icons
    end

    def groups_as_yaml
      show_as_yaml groups
    end

    private

    def data
      pp @result
    end


    def icons
      @result['icons']
    end

    def groups
      @result['groups']
    end

    def show_as_yaml data
      YAML.dump(data)
    end

    def create_agent
      url = URI.parse MDL_BASE
      agent = Net::HTTP.new url.host, url.port
      agent.use_ssl = true
      agent
    end

    def all_icons_info_json
      res = @agent.get all_icons_info_path
      json_raw = res.read_body
      JSON.parse json_raw
    end

    def all_icons_info_path
      "#{MDL_API_SUFFIX}#{MDL_API_FOR_ALL_ICONS_INFO_SUFFIX}"
    end

  end
end
