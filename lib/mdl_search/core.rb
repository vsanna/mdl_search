module MdlSearch
  class << self

    def search(query)
      set_data_from_raw
      Icon.where(query)
    end

    def groups_search(query)
      set_data_from_raw

      if query.nil?
        Icon.groups
      else
        Icon.groups.select { |g| g[:name].downcase.include? query }
      end
    end

    private

    def set_data_from_raw
      set_groups_from_raw
      set_icons_from_raw
    end

    def set_groups_from_raw
      RAW_GROUPS_TABLE.each do |group_row|
        Icon.groups << {
          id: group_row['data']['id'],
          name: group_row['data']['name'],
          length: group_row['length']
        }
      end
    end

    def set_icons_from_raw
      RAW_ICONS_TABLE.each do |icon_row|
        json_row_to_icon(icon_row)
      end
    end

    def json_row_to_icon(row)
      Icon.icons << Icon.new(
        row['ligature'],
        row['name'],
        row['codepoint'],
        row['group_id'],
        row['keywords'],
        row['is_new']
      )
    end

  end
end

