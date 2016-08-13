module MdlSearch
  class CLI < Thor

    desc 'search [--name name] [--keywords some key words]', 'search material icons by query'
    option :name, type: :string
    option :keywords, type: :array
    option :group, type: :string
    def search
      query = set_query
      MdlSearch.search(query).each do |icon|
        name = set_color(icon.name.ljust(30, ' '), :yellow)
        group = set_color(icon.group, :bold)
        say "#{name}group: #{group}"
      end
    end

    desc 'groups [query]', 'show material icons groups'
    def groups(query = nil)
      query = query.downcase unless query.nil?
      MdlSearch.groups_search(query).each do |g|
        name = set_color(g[:name].ljust(20, ' '), :yellow)
        length = set_color(g[:length].to_s.rjust(5, ' '), :bold)
        say "#{name}length:#{length}"
      end
    end

    desc 'update icons', 'show latest icons'
    def update_icons_table
      Updater.new.update_icons_yaml
    end

    desc 'update groups', 'show latest groups'
    def update_groups_table
      Updater.new.update_groups_yaml
    end

    private

    def set_query
      return nil if options.empty?
      result = {}
      result[:name] = options[:name] if options[:name]
      result[:keywords] = options[:keywords] if options[:keywords]
      result[:group] = options[:group] if options[:group]
      result
    end
  end
end
