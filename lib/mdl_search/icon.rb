module MdlSearch
  class Icon
    attr_accessor :key, :name, :codepoint, :group, :keywords, :is_new

    @groups = []
    @icons = []

    def initialize(key, name, codepoint, group, keywords, is_new)
      @key = key
      @name = name
      @codepoint = codepoint
      @group = group
      @keywords = keywords
      @is_new = is_new
    end

    def modern_browser_key
      @key
    end

    def classic_browser_key
      "&#x#{@codepoint};"
    end

    def include_value?(key, query)
      value_of_key = instance_variable_get "@#{key}"
      if value_of_key.is_a? Array
        value_of_key.any? { |v| hit_query? v, query }
      else
        hit_query? value_of_key, query
      end
    end

    def hit_query?(value, query)
      case query.class.name
      when 'String'
        value.to_s.downcase.include? query.downcase
      when 'TrueClass', 'FalseClass'
        value == query
      when 'Array'
        query.any? { |q| value.downcase.include? q.downcase }
      else
        false
      end
    end

    class << self
      attr_accessor :groups
      attr_accessor :icons

      def all
        icons
      end

      def where(hash)
        return self.all if hash.nil?
        self.all.select do |icon|
          hash.all? do |key, val|
            icon.include_value?(key, val)
          end
        end
      end

    end
  end
end
